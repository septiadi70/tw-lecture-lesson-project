import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:trinity_lecture_app/core/commons/colors_const.dart';
import 'package:trinity_lecture_app/domain/simple_calculator/entities/simple_calculator_history_model.dart';
import 'package:trinity_lecture_app/presentation/pages/simple_calculator_page/widgets/simple_calculator_history_card.dart';
import 'package:trinity_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:trinity_lecture_app/presentation/widgets/atoms/title_section_text.dart';
import 'package:trinity_lecture_app/presentation/widgets/molecules/chip.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class SimpleCalculatorPage extends StatefulWidget {
  const SimpleCalculatorPage({super.key});

  @override
  State<SimpleCalculatorPage> createState() => _SimpleCalculatorPageState();
}

class _SimpleCalculatorPageState extends State<SimpleCalculatorPage> {
  final _operations = [
    SimpleCalculationType.plus, 
    SimpleCalculationType.substract, 
    SimpleCalculationType.multiply,
    SimpleCalculationType.divide,
    SimpleCalculationType.pow
  ];
  SimpleCalculationType? _operationSelected;
  final _firstNumberTextController = TextEditingController();
  final _secondNumberTextController = TextEditingController();
  double? _calculationValue;
  final List<SimpleCalculatorHistoryModel> _history = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Calculator'),
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: UIHelper.padding(all: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TitleSectionText('CHOOSE TYPE'),
              UIHelper.verticalSpace(10),
              Wrap(
                children: _operations.map((e) {
                  return Padding(
                    padding: UIHelper.padding(all: 5),
                    child: ChipCustom(
                      onTap: () {
                        setState(() {
                          _operationSelected = e;
                          _firstNumberTextController.text = '';
                          _secondNumberTextController.text = '';
                          _calculationValue = 0;
                        });
                      }, 
                      title: e.label,
                      isChoosen: _operationSelected == e,
                    ),
                  );
                }).toList(),
              ),
              UIHelper.verticalSpace(20),
              if (_operationSelected != null)
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 80,
                          child: TextFormFieldCustom(
                            controller: _firstNumberTextController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        UIHelper.horizontalSpace(10),
                        Text(
                          _operationSelected?.value ?? '',
                          style: context.textTheme.displayLarge?.copyWith(
                            fontSize: 30
                          ),
                        ),
                        UIHelper.horizontalSpace(10),
                        SizedBox(
                          width: 80,
                          child: TextFormFieldCustom(
                            controller: _secondNumberTextController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        UIHelper.horizontalSpace(10),
                        Text(
                          '=',
                          style: context.textTheme.displayLarge?.copyWith(
                            fontSize: 30
                          ),
                        ),
                        UIHelper.horizontalSpace(10),
                        Text(
                          _calculationValue != null ? _formatDoubleValue(_calculationValue!) : '. . .',
                          style: context.textTheme.displayLarge?.copyWith(
                            fontSize: 30
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(20),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorConstant.lightGreen,
                        borderRadius: UIHelper.borderRadiusCircular(all: 10)
                      ),
                      child: Padding(
                        padding: UIHelper.padding(all: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.info_outline,
                              color: ColorConstant.green,
                              size: 20,
                            ),
                            UIHelper.horizontalSpace(10),
                            Expanded(
                              child: Text(
                                'Press calculate button to get the result',
                                style: context.textTheme.bodyLarge?.copyWith(
                                  color: ColorConstant.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              UIHelper.verticalSpace(20),
              const TitleSectionText('HISTORY'),
              UIHelper.verticalSpace(10),
              Expanded(
                child: _history.isNotEmpty ? ListView.builder(
                  itemCount: _history.length,
                  itemBuilder: (context, index) {
                    final calculate = _history[index];
                    return Padding(
                      padding: UIHelper.padding(vertical: 5),
                      child: SimpleCalculatorHistoryCard(
                        text: calculate.getLabel(), 
                        onPressed: () {
                          _firstNumberTextController.text = calculate.firstNumber;
                          _secondNumberTextController.text = calculate.secondNumber;
                          setState(() => _operationSelected = calculate.type);
                        },
                      ),
                    );
                  },
                ) : Text(
                  'No history found',
                  style: context.textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: ColorConstant.grey,
                  ),
                ),
              ),
              UIHelper.verticalSpace(10),
              ElevatedButton(
                onPressed: () => _calculate(),
                child: const Text('CALCULATE')
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDoubleValue(double value) {
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    return value.toString().replaceAll(regex, '');
  }

  void _calculate() {
    if (_operationSelected == null) return;

    final firstNumber = double.tryParse(_firstNumberTextController.text);
    final secondNumber = double.tryParse(_secondNumberTextController.text);

    if (firstNumber == null || secondNumber == null) return;

    switch (_operationSelected) {
      case SimpleCalculationType.plus:
        _calculationValue = firstNumber + secondNumber;
        break;

      case SimpleCalculationType.substract:
        _calculationValue = firstNumber - secondNumber;
        break;

      case SimpleCalculationType.multiply:
        _calculationValue = firstNumber * secondNumber;
        break;

      case SimpleCalculationType.divide:
        _calculationValue = firstNumber / secondNumber;
        break;

      case SimpleCalculationType.pow:
        _calculationValue = firstNumber % secondNumber;
        break;

      default:
    }

    setState(() {
      _history.add(
        SimpleCalculatorHistoryModel(
          firstNumber: _firstNumberTextController.text, 
          secondNumber: _secondNumberTextController.text, 
          type: _operationSelected!
        )
      );
    });
  }
}

enum SimpleCalculationType {
  plus('Add', '+'),
  substract('Substract', '-'),
  multiply('Multiply', 'X'),
  divide('Divide', '/'),
  pow('Pow', '^');

  const SimpleCalculationType(this.label, this.value);

  final String label;
  final String value;
}