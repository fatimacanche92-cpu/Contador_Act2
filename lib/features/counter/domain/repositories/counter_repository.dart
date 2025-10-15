
import 'package:dartz/dartz.dart';
import 'package:fatima1/core/errors/failures.dart';
import 'package:fatima1/features/counter/domain/entities/counter.dart';

abstract class CounterRepository {
  Future<Either<Failure, Counter>> getCounterValue();
  Future<Either<Failure, Counter>> incrementCounter();
  Future<Either<Failure, Counter>> resetCounter();
  Future<Either<Failure, Counter>> decrementCounter();
}
