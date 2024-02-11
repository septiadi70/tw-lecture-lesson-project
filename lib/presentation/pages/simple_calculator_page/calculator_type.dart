import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculator_type.freezed.dart';

@freezed
class CalculatorType with _$CalculatorType {
  const factory CalculatorType.none() = _None;
  const factory CalculatorType.add() = _Add;
  const factory CalculatorType.substract() = _Substract;
  const factory CalculatorType.multiply() = _Multiply;
  const factory CalculatorType.divide() = _Divide;
  const factory CalculatorType.pow() = _Pow;
}