import 'package:flutter/widgets.dart';
import 'package:trinity_lecture_app/core/commons/colors_const.dart';
import 'package:trinity_lecture_app/core/commons/constants.dart';
import 'package:trinity_lecture_app/core/commons/theme.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/ui_helper.dart';

class SampleContainer extends StatelessWidget {
  const SampleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIHelper.padding(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConstant.grey,
          width: 0.5
        ),
        borderRadius: UIHelper.borderRadiusCircular(all: 10)
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: UIHelper.borderRadiusCircular(all: 10),
            child: Image.network(
              Constants.dummyImg,
              width: UIHelper.setSp(70),
              height: UIHelper.setSp(70),
              fit: BoxFit.cover,
            ),
          ),
          UIHelper.horizontalSpace(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'How can I be Flutter Developer Expert?',
                  style: AppTheme.textTheme.headlineSmall,
                ),
                UIHelper.verticalSpace(10),
                Text(
                  'Jill Lepore * 23 May 2023',
                  style: AppTheme.textTheme.bodySmall,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}