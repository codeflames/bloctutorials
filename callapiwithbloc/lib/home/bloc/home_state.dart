part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeLoadingState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState {
  final String? activityName;
  final String? activityType;
  final int? participants;

  HomeLoadedState(this.activityName, this.activityType, this.participants);

  @override
  List<Object?> get props => [activityName, activityType, participants];
}

class HomeNoInternetState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
