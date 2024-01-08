import 'package:flutter/material.dart';
import 'package:trinity_lecture_app/core/commons/colors_const.dart';
import 'package:trinity_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';

class NewsSectionTitleText extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? buttonText;
  final VoidCallback? onPressed;

  const NewsSectionTitleText({
    super.key, 
    required this.title, 
    required this.subtitle,
    this.buttonText,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: context.textTheme.headlineLarge,
              ),
            ),
            if (buttonText != null)
              InkWell(
                onTap: onPressed,
                child: Text(
                  buttonText!,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: ColorConstant.primary,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
          ],
        ),
        Text(
          subtitle,
          style: context.textTheme.bodyLarge?.copyWith(
            color: ColorConstant.grey
          ),
        ),
      ],
    );
  }
}