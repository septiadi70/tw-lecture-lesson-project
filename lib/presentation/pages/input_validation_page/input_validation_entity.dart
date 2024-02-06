import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trinity_lecture_app/domain/core/form_failure.dart';
import 'package:trinity_lecture_app/domain/core/form_validator.dart';

part 'input_validation_entity.freezed.dart';

@freezed
class InputValidationEntity with _$InputValidationEntity {
  const InputValidationEntity._();

  const factory InputValidationEntity({
    required String name,
    required String email,
  }) = _InputValidationEntity;

  factory InputValidationEntity.empty() => const InputValidationEntity(
    name: '', 
    email: ''
  ); 

  Option<FormFailure> get failureOption {
    return FormValidator
    .emptyValidator(name)
    .andThen(() => FormValidator.emailValidator(email))
    .fold((failure) => some(failure), (_) => none(),
    );
  }

  String? get nameErrorMsg {
    return FormValidator
    .emptyValidator(name)
    .fold(
      (failure) => failure.maybeMap(
        orElse: () => null, empty: (value) => 'Name must not be empty',
      ), 
      (_) => null
    );
  }

  String? get emailErrorMsg {
    return FormValidator
    .emailValidator(email)
    .fold(
      (failure) => failure.map(
        empty: (_) => 'Email must not be empty', 
        tooLong: (_) => 'Email is too long', 
        invalidEmailAddress: (_) => 'Invalid email address',
        costumError: (value) => '',), 
      (data) => null
    );
  }
}