import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:trinity_lecture_app/presentation/pages/simple_calculator_page/calculator_state.dart';
import 'package:trinity_lecture_app/presentation/pages/simple_calculator_page/calculator_type.dart';
import 'package:trinity_lecture_app/presentation/pages/simple_calculator_page/history_entity.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  late TextEditingController leftController;
  late TextEditingController rightController;

  CalculatorCubit() : super(CalculatorState.empty()) {
    leftController = TextEditingController()..addListener(onLeftControllerChange);
    rightController = TextEditingController()..addListener(onRightControllerChange);
  }

  void inputLeftValue(String val) {
    emit(state.unmodified.copyWith.model(leftValue: val));
  }

  void inputRightValue(String val) {
    emit(state.unmodified.copyWith.model(rightValue: val));
  }

  void onLeftControllerChange() {
    inputLeftValue(leftController.text);
  }

  void onRightControllerChange() {
    inputRightValue(rightController.text);
  }

  void saveToHistories(double value) {
    emit(
      state.unmodified.copyWith(isPressed: true)
      .copyWith.model(
        histories: state.model.newHistory, 
        value: value,
      ),
    );
  }

  void submit() {
    state.model.failureOption.fold(
      () => state.model.type.when(
        none: () {}, 
        add: () => saveToHistories(state.model.addMethod), 
        substract: () => saveToHistories(state.model.substractMethod), 
        multiply: () => saveToHistories(state.model.multiplyMethod), 
        divide: () => saveToHistories(state.model.divideMethod), 
        pow: () => saveToHistories(state.model.powMethod),
      ), 
      (failure) => emit(state.unmodified.copyWith(showError: true),),
    );
  }

  void restoreHistory(HistoryEntity entity) {
    leftController.removeListener(onLeftControllerChange);
    rightController.removeListener(onRightControllerChange);

    leftController.value = TextEditingValue(text: entity.leftValue);
    rightController.value = TextEditingValue(text: entity.rightValue);

    leftController.addListener(onLeftControllerChange);
    rightController.addListener(onRightControllerChange);

    emit(
      state.unmodified.copyWith.model(
        leftValue: entity.leftValue,
        rightValue: entity.rightValue,
        type: entity.type,
        histories: state.model.removeHistory(entity),
      ),
    );
  }

  void chooseType(CalculatorType type) {
    emit(state.unmodified.copyWith.model(type: type));
  }
}