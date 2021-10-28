part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class IncrementEvent extends CounterEvent {
  @override
  List<Object> get props => [];
}

class DecrementEvent extends CounterEvent {
  @override
  List<Object> get props => [];
}
class ResertEvent extends CounterEvent {
  @override
  List<Object> get props => [];
}
