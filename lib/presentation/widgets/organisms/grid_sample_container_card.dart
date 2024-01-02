import 'package:flutter/widgets.dart';
import 'package:trinity_lecture_app/core/commons/colors_const.dart';
import 'package:trinity_lecture_app/core/commons/constants.dart';
import 'package:trinity_lecture_app/core/commons/theme.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/ui_helper.dart';

class GridSampleContainerCard extends StatelessWidget {
  final String title;
  final int flex;

  const GridSampleContainerCard({super.key, required this.title, this.flex = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: UIHelper.setSp(120),
      padding: UIHelper.padding(all: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConstant.grey,
          width: 0.5
        ),
        borderRadius: UIHelper.borderRadiusCircular(all: 10)
      ),
      child: Center(
        child: Column(
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
            UIHelper.verticalSpace(10),
            Expanded(
              child: Text(
                title,
                style: AppTheme.textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}