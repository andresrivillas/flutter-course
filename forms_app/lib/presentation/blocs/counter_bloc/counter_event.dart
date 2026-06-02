part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

class CounterIncreased extends CounterEvent {
  final int value;
  CounterIncreased({required this.value});
}

class CounterReset extends CounterEvent {
  CounterReset();
}
