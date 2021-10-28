import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(1);

  @override
  // CounterState get initialState => CounterState(1);

  @override
  Stream<int> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is IncrementEvent) {
      yield state + 1;
    } else if (event is DecrementEvent) {
      yield state == 0 ? 0 : state - 1;
    } else if (event is ResertEvent) {
      yield 1;
    }
  }
}
