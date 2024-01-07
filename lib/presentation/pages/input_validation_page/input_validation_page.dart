import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trinity_lecture_app/core/commons/colors_const.dart';
import 'package:trinity_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class InputValidationPage extends StatefulWidget {
  const InputValidationPage({super.key});

  @override
  State<InputValidationPage> createState() => _InputValidationPageState();
}

class _InputValidationPageState extends State<InputValidationPage> {
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameTextController.dispose();
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Validation'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: UIHelper.padding(vertical: 10, horizontal: 20),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Hi There',
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.primary,
                    ),
                  ),
                  Text(
                    'Please enter your name and email :)',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: ColorConstant.grey,
                    ),
                  ),
                  UIHelper.verticalSpace(30),
                  TextFormFieldCustom(
                    hintText: 'Enter your name...',
                    preffixIcon: SvgPicture.asset('assets/svgs/user_icon.svg'),
                    title: 'Name',
                    controller: _nameTextController,
                    validator: (text) {
                      if (text == null || text.isEmpty) return 'Name cannot be empty';
                      return null;
                    },
                  ),
                  UIHelper.verticalSpace(20),
                  TextFormFieldCustom(
                    hintText: 'Enter your email...',
                    preffixIcon: SvgPicture.asset('assets/svgs/email_icon.svg'),
                    title: 'Email',
                    controller: _emailTextController,
                    validator: (text) {
                      if (text == null || text.isEmpty) return 'Email cannot be empty';
                      return null;
                    },
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('SUBMIT')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}