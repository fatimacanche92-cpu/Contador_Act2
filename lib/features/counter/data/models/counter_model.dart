
import 'package:fatima1/features/counter/domain/entities/counter.dart';

class CounterModel extends Counter {
  const CounterModel({required int value}) : super(value: value);

  factory CounterModel.fromJson(Map<String, dynamic> json) {
    return CounterModel(value: json['value']);
  }

  Map<String, dynamic> toJson() {
    return {'value': value};
  }
}
