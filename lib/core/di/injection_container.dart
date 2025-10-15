
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fatima1/features/counter/data/datasources/counter_local_data_source.dart';
import 'package:fatima1/features/counter/data/repositories/counter_repository_impl.dart';
import 'package:fatima1/features/counter/domain/repositories/counter_repository.dart';
import 'package:fatima1/features/counter/domain/usecases/counter_usecases.dart';
import 'package:fatima1/features/counter/presentation/bloc/counter_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Counter
  // Bloc
  sl.registerFactory(
    () => CounterCubit(
      getCounterValue: sl(),
      incrementCounter: sl(),
      resetCounter: sl(),
      decrementCounter: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetCounterValue(sl()));
  sl.registerLazySingleton(() => IncrementCounter(sl()));
  sl.registerLazySingleton(() => ResetCounter(sl()));
  sl.registerLazySingleton(() => DecrementCounter(sl()));

  // Repository
  sl.registerLazySingleton<CounterRepository>(
    () => CounterRepositoryImpl(localDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<CounterLocalDataSource>(
    () => CounterLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // Core

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
