
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fatima1/core/config/theme/text_styles.dart';
import 'package:fatima1/features/counter/presentation/bloc/counter_cubit.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<CounterCubit>().reset();
            },
          ),
        ],
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          if (state is CounterLoading || state is CounterInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CounterLoaded) {
            final count = state.counter.value;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$count',
                    style: AppTextStyles.counterNumber,
                  ),
                  Text(
                    count == 1 ? 'click...' : 'clicks...',
                    style: AppTextStyles.counterLabel,
                  ),
                ],
              ),
            );
          } else if (state is CounterError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () => context.read<CounterCubit>().decrement(),
            ),
            const SizedBox(width: 24),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => context.read<CounterCubit>().reset(),
            ),
            const SizedBox(width: 24),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => context.read<CounterCubit>().increment(),
            ),
          ],
        ),
      ),
    );
  }
}
