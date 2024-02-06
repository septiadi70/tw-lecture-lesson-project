import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:trinity_lecture_app/presentation/pages/input_validation_page/input_validation_state.dart';

class InputValidationCubit extends Cubit<InputValidationState> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  InputValidationCubit() : super(InputValidationState.initial()) {
    nameController = TextEditingController()
    ..addListener(() {
      inputName(nameController.text);
    });

    emailController = TextEditingController()
    ..addListener(() {
      inputEmail(emailController.text);
    });
  }

  void inputName(String val) {
    emit(state.unmodified.copyWith.model(name: val));
  }

  void inputEmail(String val) {
    emit(state.unmodified.copyWith.model(email: val));
  }

  void submit() {
    if (state.model.failureOption.isNone()) {
      emit(state.copyWith(changeStates: true));
    } else {
      emit(state.unmodified.copyWith(changeStates: state.unmodified.showError, showError: true));
    }
  }
}