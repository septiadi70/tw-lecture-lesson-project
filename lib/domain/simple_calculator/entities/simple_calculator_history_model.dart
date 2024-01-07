import 'package:trinity_lecture_app/presentation/pages/simple_calculator_page/simple_calculator_page.dart';

class SimpleCalculatorHistoryModel {
  final String firstNumber;
  final String secondNumber;
  final SimpleCalculationType type;

  const SimpleCalculatorHistoryModel({
    required this.firstNumber,
    required this.secondNumber,
    required this.type
  });

  String getLabel() {
    return '$firstNumber ${type.value} $secondNumber';
  }
}