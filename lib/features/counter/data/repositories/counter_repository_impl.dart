
import 'package:dartz/dartz.dart';
import 'package:fatima1/core/errors/exceptions.dart';
import 'package:fatima1/core/errors/failures.dart';
import 'package:fatima1/features/counter/data/datasources/counter_local_data_source.dart';
import 'package:fatima1/features/counter/domain/entities/counter.dart';
import 'package:fatima1/features/counter/domain/repositories/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource localDataSource;

  CounterRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, Counter>> getCounterValue() async {
    try {
      final localCounterValue = await localDataSource.getLastCounterValue();
      return Right(Counter(value: localCounterValue));
    } on CacheException {
      // Si no hay valor en caché, empezamos desde 0.
      return const Right(Counter(value: 0));
    }
  }

  @override
  Future<Either<Failure, Counter>> incrementCounter() async {
    try {
      int currentCounterValue = 0;
      try {
        currentCounterValue = await localDataSource.getLastCounterValue();
      } on CacheException {
        // Ignoramos la excepción si no hay nada en caché, asumimos 0.
        currentCounterValue = 0;
      }
      
      final newCounterValue = currentCounterValue + 1;
      await localDataSource.cacheCounterValue(newCounterValue);
      return Right(Counter(value: newCounterValue));

    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Counter>> resetCounter() async {
    try {
      await localDataSource.cacheCounterValue(0);
      return const Right(Counter(value: 0));
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Counter>> decrementCounter() async {
    try {
      int currentCounterValue = 0;
      try {
        currentCounterValue = await localDataSource.getLastCounterValue();
      } on CacheException {
        currentCounterValue = 0;
      }
      
      final newCounterValue = currentCounterValue > 0 ? currentCounterValue - 1 : 0;
      await localDataSource.cacheCounterValue(newCounterValue);
      return Right(Counter(value: newCounterValue));

    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
