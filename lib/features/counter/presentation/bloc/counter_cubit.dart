
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fatima1/core/usecases/usecase.dart';
import 'package:fatima1/features/counter/domain/entities/counter.dart';
import 'package:fatima1/features/counter/domain/usecases/counter_usecases.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final GetCounterValue getCounterValue;
  final IncrementCounter incrementCounter;
  final ResetCounter resetCounter;
  final DecrementCounter decrementCounter;

  CounterCubit({
    required this.getCounterValue,
    required this.incrementCounter,
    required this.resetCounter,
    required this.decrementCounter,
  }) : super(CounterInitial());

  Future<void> loadInitialValue() async {
    emit(CounterLoading());
    final failureOrCounter = await getCounterValue(NoParams());
    failureOrCounter.fold(
      (failure) => emit(const CounterError('Failed to load counter value')),
      (counter) => emit(CounterLoaded(counter)),
    );
  }

  Future<void> increment() async {
    final failureOrCounter = await incrementCounter(NoParams());
    failureOrCounter.fold(
      (failure) => emit(const CounterError('Failed to increment counter')),
      (counter) => emit(CounterLoaded(counter)),
    );
  }

  Future<void> reset() async {
    final failureOrCounter = await resetCounter(NoParams());
    failureOrCounter.fold(
      (failure) => emit(const CounterError('Failed to reset counter')),
      (counter) => emit(CounterLoaded(counter)),
    );
  }

  Future<void> decrement() async {
    final failureOrCounter = await decrementCounter(NoParams());
    failureOrCounter.fold(
      (failure) => emit(const CounterError('Failed to decrement counter')),
      (counter) => emit(CounterLoaded(counter)),
    );
  }
}
