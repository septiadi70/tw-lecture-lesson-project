import 'package:flutter/widgets.dart';
import 'package:trinity_lecture_app/core/commons/colors_const.dart';
import 'package:trinity_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';

class TitleSectionText extends StatelessWidget {
  final String string;

  const TitleSectionText(this.string, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      string,
      style: context.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: ColorConstant.green,
      ),
      textAlign: TextAlign.left,
    );
  }
}