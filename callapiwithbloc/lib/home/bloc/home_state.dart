part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final String activityName;
  final String activityType;
  final int participants;

  HomeLoadedState(this.activityName, this.activityType, this.participants);
  List<Object?> get props => [];
}

class HomeNoInternerState extends HomeState {}
