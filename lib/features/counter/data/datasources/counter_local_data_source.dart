
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fatima1/core/errors/exceptions.dart';

const CACHED_COUNTER_VALUE = 'CACHED_COUNTER_VALUE';

abstract class CounterLocalDataSource {
  Future<int> getLastCounterValue();
  Future<void> cacheCounterValue(int value);
  Future<int> decrementCounter();
}

class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  final SharedPreferences sharedPreferences;

  CounterLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<int> getLastCounterValue() {
    final value = sharedPreferences.getInt(CACHED_COUNTER_VALUE);
    if (value != null) {
      return Future.value(value);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheCounterValue(int value) {
    return sharedPreferences.setInt(CACHED_COUNTER_VALUE, value);
  }

  @override
  Future<int> decrementCounter() async {
    int currentValue = await getLastCounterValue();
    if (currentValue > 0) {
      currentValue--;
      await cacheCounterValue(currentValue);
    }
    return currentValue;
  }
}
