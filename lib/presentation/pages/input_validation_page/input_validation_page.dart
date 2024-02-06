import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trinity_lecture_app/core/commons/assets_path.dart';
import 'package:trinity_lecture_app/core/commons/colors_const.dart';
import 'package:trinity_lecture_app/presentation/pages/input_validation_page/input_validation_cubit.dart';
import 'package:trinity_lecture_app/presentation/pages/input_validation_page/input_validation_state.dart';
import 'package:trinity_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class InputValidationPage extends StatelessWidget {
  const InputValidationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InputValidationCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Input Validation'),
            ),
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: Container(
              margin: UIHelper.padding(horizontal: 10, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  context.read<InputValidationCubit>().submit();
                },
                child: const Text('SUBMIT',),
              ),
            ),
            body: BlocBuilder<InputValidationCubit, InputValidationState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  padding: UIHelper.padding(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        state.title,
                        style: context.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.primary,
                        ),
                      ),
                      Text(
                        state.description,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: ColorConstant.darkGrey,
                        ),
                      ),
                      UIHelper.verticalSpace(30,),
                      TextFormFieldCustom(
                        hintText: 'Enter your name...',
                        preffixIcon: SvgPicture.asset(
                          AssetsPath.userIcon,
                          width: UIHelper.setSp(15),
                        ),
                        title: 'Name',
                        controller: context.read<InputValidationCubit>().nameController,
                        validator: (_) => state.showNameError,
                      ),
                      UIHelper.verticalSpace(30,),
                      TextFormFieldCustom(
                        hintText: 'Enter your email...',
                        preffixIcon: SvgPicture.asset(
                          AssetsPath.emailIcon,
                          width: UIHelper.setSp(15),
                        ),
                        title: 'Email',
                        controller: context.read<InputValidationCubit>().emailController,
                        validator: (_) => state.showEmailError,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}