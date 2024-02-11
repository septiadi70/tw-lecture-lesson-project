import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trinity_lecture_app/core/commons/colors_const.dart';
import 'package:trinity_lecture_app/presentation/pages/simple_calculator_page/calculator_cubit.dart';
import 'package:trinity_lecture_app/presentation/pages/simple_calculator_page/calculator_state.dart';
import 'package:trinity_lecture_app/presentation/pages/simple_calculator_page/calculator_type.dart';
import 'package:trinity_lecture_app/presentation/pages/simple_calculator_page/widgets/simple_calculator_history_card.dart';
import 'package:trinity_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:trinity_lecture_app/presentation/widgets/atoms/title_section_text.dart';
import 'package:trinity_lecture_app/presentation/widgets/molecules/chip.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class SimpleCalculatorPage extends StatelessWidget {
  const SimpleCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculatorCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<CalculatorCubit, CalculatorState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text('Simple Calculator',),
                  ),
                  resizeToAvoidBottomInset: false,
                  body: SingleChildScrollView(
                    padding: UIHelper.padding(vertical: 20, horizontal: 20,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const TitleSectionText('CHOOSE TYPE',),
                        UIHelper.verticalSpace(20,),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            ChipCustom(
                              isChoosen: state.choosenType(const CalculatorType.add()),
                              title: 'Add',
                              onTap: () => context.read<CalculatorCubit>().chooseType(const CalculatorType.add()),
                            ),
                            ChipCustom(
                              isChoosen: state.choosenType(const CalculatorType.substract()),
                              title: 'Substract',
                              onTap: () => context.read<CalculatorCubit>().chooseType(const CalculatorType.substract()),
                            ),
                            ChipCustom(
                              isChoosen: state.choosenType(const CalculatorType.multiply()),
                              title: 'Multiply',
                              onTap: () => context.read<CalculatorCubit>().chooseType(const CalculatorType.multiply()),
                            ),
                            ChipCustom(
                              isChoosen: state.choosenType(const CalculatorType.divide()),
                              title: 'Divide',
                              onTap: () => context.read<CalculatorCubit>().chooseType(const CalculatorType.divide()),
                            ),
                            ChipCustom(
                              isChoosen: state.choosenType(const CalculatorType.pow()),
                              title: 'Pow',
                              onTap: () => context.read<CalculatorCubit>().chooseType(const CalculatorType.pow()),
                            ),
                          ]
                        ),
                        UIHelper.verticalSpace(20),
                        if (!state.typeNotChoosen)
                          Column(
                            children: [
                              UIHelper.verticalSpace(20),
                              Row(
                                crossAxisAlignment: state.choosenType(const CalculatorType.pow()) ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: UIHelper.setSp(60),
                                    child: TextFormFieldCustom(
                                      controller: context.read<CalculatorCubit>().leftController,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      style: context.textTheme.displayLarge,
                                    ),
                                  ),
                                  UIHelper.horizontalSpace(10,),
                                  if (state.equationText(state.model.type).isNotEmpty) ... [
                                    Text(
                                      state.equationText(state.model.type),
                                      style: context.textTheme.displayLarge?.copyWith(
                                        fontSize: UIHelper.setSp(30),
                                      ),
                                    ),
                                    UIHelper.horizontalSpace(10,),
                                  ],
                                  SizedBox(
                                    width: UIHelper.setSp(60),
                                    child: TextFormFieldCustom(
                                      controller: context.read<CalculatorCubit>().rightController,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      style: context.textTheme.displayLarge,
                                    ),
                                  ),
                                  UIHelper.horizontalSpace(10,),
                                  Text(
                                    '= ${state.displayValue}',
                                    style: context.textTheme.displayLarge?.copyWith(
                                      fontSize: UIHelper.setSp(40),
                                    ),
                                  ),
                                ],
                              ),
                              UIHelper.verticalSpace(20,),
                              Container(
                                padding: UIHelper.padding(vertical: 10, horizontal: 15,),
                                decoration: BoxDecoration(
                                  color: ColorConstant.lightGreen,
                                  borderRadius: UIHelper.borderRadiusCircular(all: 5),
                                ),
                                child: Padding(
                                  padding: UIHelper.padding(all: 10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.info_outline_rounded,
                                        color: state.showErrorMsg == null ? ColorConstant.green : ColorConstant.red,
                                      ),
                                      UIHelper.horizontalSpace(10,),
                                      Expanded(
                                        child: Text(
                                          state.showErrorMsg ?? 'Press calculate button to get the result',
                                          style: context.textTheme.bodySmall?.copyWith(
                                            color: state.showErrorMsg == null ? ColorConstant.grey : ColorConstant.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        UIHelper.verticalSpace(20,),
                        const TitleSectionText('HISTORY',),
                        UIHelper.verticalSpace(10,),
                        state.model.histories.isEmpty ?
                        Text(
                          'No history found',
                          style: context.textTheme.bodySmall?.copyWith(
                            fontStyle: FontStyle.italic,
                            color: ColorConstant.grey,
                          ),
                        ) :
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.model.histories.length,
                          itemBuilder: (context, index) {
                            final history = state.model.histories[index];
                            return Padding(
                              padding: UIHelper.padding(vertical: 5),
                              child: SimpleCalculatorHistoryCard(
                                text: state.historyText(history), 
                                onPressed: () {
                                  context.read<CalculatorCubit>().restoreHistory(history);
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  bottomNavigationBar: Container(
                    margin: UIHelper.padding(horizontal: 10, vertical: 20),
                    child: ElevatedButton(
                      onPressed: () => context.read<CalculatorCubit>().submit(),
                      child: const Text('CALCULATE',),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}