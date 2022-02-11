import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counter_app/home/repository/home_repository.dart';
import 'package:counter_app/services/connectivityservice/connectivity_service.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;
  final ConnectivityService _connectivityService;
  HomeBloc(this._homeRepository, this._connectivityService)
      : super(HomeLoadingState()) {
    _noInternetStream();

    on<LoadApiEvent>(_loadActivity);
    on<NoInternetEvent>(_noInternetActivity);
  }

  FutureOr<void> _loadActivity(
      LoadApiEvent event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoadingState());
      final activity = await _homeRepository.getActivity();
      emit(HomeLoadedState(
          activity.activity, activity.type, activity.participants));
    } catch (e) {
      emit(HomeErrorState());
      rethrow;
    }
  }

  FutureOr<void> _noInternetStream() {
    _connectivityService.connectivityStreamController.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        add(NoInternetEvent());
      } else {
        add(LoadApiEvent());
      }
    });
  }

  FutureOr<void> _noInternetActivity(
      NoInternetEvent event, Emitter<HomeState> emit) {
    emit(HomeNoInternetState());
  }
}
