import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => CounterBloc(), child: BlocCounterView());
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({super.key});

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncreased(value: value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterBloc bloc) =>
              Text("Bloc Counter: ${bloc.state.transactionCount}"),
        ),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().add(CounterReset()),

            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: context.select(
          (CounterBloc counterBloc) =>
              Text("Counter value: ${counterBloc.state.counter}"),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context, 3),
            heroTag: "1",
            child: Text("+3"),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context, 2),
            heroTag: "2",
            child: Text("+2"),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context),
            heroTag: "3",
            child: Text("+1"),
          ),
        ],
      ),
    );
  }
}
