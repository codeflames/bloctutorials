import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

// increase the counter value
  void increment() {
    return emit(state + 1);
  }

// reduce the counter value
  void decrement() {
    if (state == 0) {
      return;
    }
    return emit(state - 1);
  }
}
