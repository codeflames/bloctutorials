import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:infinitelist/posts/models/post.dart';
import 'package:stream_transform/stream_transform.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostState> {
  PostsBloc({required this.httpClient}) : super(const PostState()) {
    on<PostFetched>(_postFetched,
        transformer: throttleDroppable(throttleDuration));
  }
  final http.Client httpClient;

  FutureOr<void> _postFetched(
      PostFetched event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PostStatus.initial) {
        final posts = await _fetchPosts();
        return emit(state.copyWith(
          posts: posts,
          status: PostStatus.success,
          hasReachedMax: false,
        ));
      }
      final posts = await _fetchPosts(state.posts.length);
      posts.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(state.copyWith(
              status: PostStatus.success, posts: posts, hasReachedMax: false));
    } catch (e) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }
}

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

const _postLimit = 20;

Future<List<Post>> _fetchPosts([int startIndex = 0]) async {
  final response = await http.get(
    Uri.https(
      'jsonplaceholder.typicode.com',
      '/posts',
      <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
    ),
  );
  if (response.statusCode == 200) {
    final body = json.decode(response.body) as List;
    return body.map((dynamic json) {
      return Post(
        id: json['id'] as int,
        title: json['title'] as String,
        body: json['body'] as String,
      );
    }).toList();
    // log(response.body);

    // final List<Post> body = Post.fromJson(response.body) as List<Post>;

    // log(body.toString());

    // return body;
  }
  throw Exception('error fetching posts');
}
