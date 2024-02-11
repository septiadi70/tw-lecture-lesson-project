import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trinity_lecture_app/presentation/pages/simple_calculator_page/calculator_entity.dart';
import 'package:trinity_lecture_app/presentation/pages/simple_calculator_page/calculator_type.dart';
import 'package:trinity_lecture_app/presentation/pages/simple_calculator_page/history_entity.dart';

part 'calculator_state.freezed.dart';

@freezed
class CalculatorState with _$CalculatorState {
  const CalculatorState._();
  const factory CalculatorState({
    required CalculatorEntity model,
    required bool showError,
    required bool isPressed,
  }) = _CalculatorState;

  factory CalculatorState.empty() => CalculatorState(
    model: CalculatorEntity.empty(), 
    showError: false, 
    isPressed: false,
  );

  CalculatorState get unmodified => copyWith(
    isPressed: false,
  );

  bool choosenType(CalculatorType type) {
    return type == model.type;
  }

  bool get typeNotChoosen => model.type == const CalculatorType.none();

  String get displayValue => !isPressed ? '...' : model.convertValue;

  String? get showErrorMsg => showError ? model.textErrorMsg : null;

  String equationText(CalculatorType type) {
    return type.when(
      none: () => '', 
      add: () => '+', 
      substract: () => '-', 
      multiply: () => 'x', 
      divide: () => '/', 
      pow: () => '^',
    );
  }

  String historyText(HistoryEntity entity) {
    final equation = equationText(entity.type);
    return '${entity.leftValue} $equation ${entity.rightValue}';
  }
}