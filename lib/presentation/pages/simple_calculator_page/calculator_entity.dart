import 'dart:math';

import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trinity_lecture_app/domain/core/form_failure.dart';
import 'package:trinity_lecture_app/domain/core/form_validator.dart';
import 'package:trinity_lecture_app/presentation/pages/simple_calculator_page/calculator_type.dart';
import 'package:trinity_lecture_app/presentation/pages/simple_calculator_page/history_entity.dart';

part 'calculator_entity.freezed.dart';

@freezed
class CalculatorEntity with _$CalculatorEntity {
  const CalculatorEntity._();
  const factory CalculatorEntity({
    required double value,
    required String leftValue,
    required String rightValue,
    required CalculatorType type,
    required List<HistoryEntity> histories,
  }) = _CalculatorEntity;

  factory CalculatorEntity.empty() => const CalculatorEntity(
    value: 0, 
    leftValue: "", 
    rightValue: "", 
    type: CalculatorType.none(), 
    histories: []
  );

  Option<FormFailure> get failureOption {
    return FormValidator.emptyValidator(leftValue)
    .andThen(() => type == const CalculatorType.pow() ? right(unit) : FormValidator.emptyValidator(rightValue))
    .andThen(() => FormValidator.customValidator(validator: cannotBeDividedByZero))
    .fold(
      (failure) => some(failure), 
      (_) => none(),
    );
  }

  Either<String, Unit> get _emptyLeftErrorMsg {
    return FormValidator.emptyValidator(leftValue).fold(
      (failure) => failure.maybeMap(
        orElse: () => right(unit),
        empty: (_) => left('Left form must not be empty'),
      ), 
      (_) => right(unit),
    );
  }

  Either<String, Unit> get _zeroRightErrorMsg {
    return FormValidator.customValidator(validator: cannotBeDividedByZero).fold(
      (failure) => failure.maybeMap(
        orElse: () => right(unit),
        costumError: (_) => left('Cannot be divided by zero'),
      ), 
      (_) => right(unit)
    );
  }

  Either<String, Unit> get _emptyRightErrorMsg {
    return FormValidator.emptyValidator(rightValue).fold(
      (failure) => failure.maybeMap(
        orElse: () => right(unit),
        empty: (_) => left('Right form must not be empty'),
      ), 
      (_) => right(unit)
    );
  }

  String? get textErrorMsg {
    return _emptyLeftErrorMsg
    .andThen(() => _emptyRightErrorMsg)
    .andThen(() => _zeroRightErrorMsg)
    .fold(
      (errorText) => errorText, 
      (formValid) => null
    );
  }

  List<HistoryEntity> removeHistory(HistoryEntity entity) {
    final newHistories = [...histories];
    newHistories.removeWhere((element) => element == entity);
    return newHistories;
  }

  double get addMethod {
    return double.parse(leftValue) + double.parse(rightValue);
  }

  double get powMethod {
    return pow(int.parse(leftValue), int.parse(rightValue)).toDouble();
  }

  double get divideMethod {
    return double.parse(leftValue) / double.parse(rightValue);
  }

  double get multiplyMethod {
    return double.parse(leftValue) * double.parse(rightValue);
  }

  double get substractMethod {
    return double.parse(leftValue) - double.parse(rightValue);
  }

  bool get cannotBeDividedByZero {
    if (rightValue.isNotEmpty) {
      return int.parse(rightValue) == 0 && type == const CalculatorType.divide();
    }
    return type == const CalculatorType.divide();
  }

  String get convertValue {
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    final valueSplitted = value.toString().split('.');
    if (valueSplitted[1].length == 1) {
      return value.toString().replaceAll(regex, '');
    }
    return value.toStringAsFixed(2).replaceAll(regex, '');
  }

  bool get _isAlreadyAddedInHistories {
    var newHistories = [...histories];
    var isFound = newHistories.any(
      (element) => element.leftValue == leftValue && element.type == type && element.rightValue == rightValue,
    );
    return isFound;
  }

  List<HistoryEntity> get newHistory {
    final calculationHistory = HistoryEntity.newEntity(
      leftValue: leftValue, 
      rightValue: rightValue, 
      type: type
    );
    if (!_isAlreadyAddedInHistories) {
      final newHistories = [...histories, calculationHistory];
      return newHistories;
    }
    return histories;
  }

  
}