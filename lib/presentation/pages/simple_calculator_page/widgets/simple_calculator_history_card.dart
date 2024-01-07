import 'package:flutter/material.dart';
import 'package:trinity_lecture_app/core/commons/colors_const.dart';
import 'package:trinity_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';

class SimpleCalculatorHistoryCard extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const SimpleCalculatorHistoryCard({
    super.key, 
    required this.text, 
    required this.onPressed
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
                text,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: onPressed,
              child: const Text(
                'Re-Apply'
              ),
            )
          ],
        ),
        const Divider(
          color: ColorConstant.lightGrey,
        )
      ],
    );
  }
}