
import 'package:dartz/dartz.dart';
import 'package:fatima1/core/errors/failures.dart';
import 'package:fatima1/core/usecases/usecase.dart';
import 'package:fatima1/features/counter/domain/entities/counter.dart';
import 'package:fatima1/features/counter/domain/repositories/counter_repository.dart';

class GetCounterValue extends UseCase<Counter, NoParams> {
  final CounterRepository repository;

  GetCounterValue(this.repository);

  @override
  Future<Either<Failure, Counter>> call(NoParams params) async {
    return await repository.getCounterValue();
  }
}

class IncrementCounter extends UseCase<Counter, NoParams> {
  final CounterRepository repository;

  IncrementCounter(this.repository);

  @override
  Future<Either<Failure, Counter>> call(NoParams params) async {
    return await repository.incrementCounter();
  }
}

class ResetCounter extends UseCase<Counter, NoParams> {
  final CounterRepository repository;

  ResetCounter(this.repository);

  @override
  Future<Either<Failure, Counter>> call(NoParams params) async {
    return await repository.resetCounter();
  }
}

class DecrementCounter extends UseCase<Counter, NoParams> {
  final CounterRepository repository;

  DecrementCounter(this.repository);

  @override
  Future<Either<Failure, Counter>> call(NoParams params) async {
    return await repository.decrementCounter();
  }
}
