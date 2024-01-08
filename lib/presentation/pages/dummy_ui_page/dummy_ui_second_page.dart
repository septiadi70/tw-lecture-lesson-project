import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:trinity_lecture_app/core/commons/constants.dart';
import 'package:trinity_lecture_app/presentation/pages/dummy_ui_page/widgets/dummy_grid_card.dart';
import 'package:trinity_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class DummyUISecondPage extends StatelessWidget {
  const DummyUISecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dummy UI'),
          bottom: TabBar(
            labelPadding: UIHelper.padding(all: 10),
            tabs: [
              Text(
                'ListView',
                style: context.textTheme.headlineSmall,
              ),
              Text(
                'GridView',
                style: context.textTheme.headlineSmall,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: UIHelper.padding(all: 10),
                  child: NewsCard(imgSrc: Constants.dummyImg, title: 'How can I be Flutter Developer Expert?', desc: 'Jill Lepore * 23 May 2023',),
                );
              },
            ),
            Padding(
              padding: UIHelper.padding(all: 10),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                shrinkWrap: true,
                childAspectRatio: 120/90,
                children: List.generate(9, (index) {
                  return DummyGridCard(title: 'Container ${index + 1}');
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}