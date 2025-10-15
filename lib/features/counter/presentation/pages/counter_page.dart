
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fatima1/core/di/injection_container.dart';
import 'package:fatima1/features/counter/presentation/bloc/counter_cubit.dart';
import 'package:fatima1/features/counter/presentation/widgets/counter_view.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CounterCubit>()..loadInitialValue(),
      child: const CounterView(),
    );
  }
}
