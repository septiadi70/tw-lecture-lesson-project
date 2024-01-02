import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trinity_lecture_app/core/commons/colors_const.dart';

class TitleSectionText extends StatelessWidget {
  final String string;

  const TitleSectionText(this.string, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      string,
      style: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: ColorConstant.green,
      ),
      textAlign: TextAlign.left,
    );
  }
}