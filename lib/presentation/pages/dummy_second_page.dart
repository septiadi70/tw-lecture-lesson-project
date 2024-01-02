import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:trinity_lecture_app/core/commons/theme.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/grid_sample_container_card.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/sample_container.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class DummySecondPage extends StatelessWidget {
  const DummySecondPage({super.key});

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
                style: AppTheme.textTheme.headlineSmall,
              ),
              Text(
                'GridView',
                style: AppTheme.textTheme.headlineSmall,
              )
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
                  child: const SampleContainer(),
                );
            },),
            Padding(
              padding: UIHelper.padding(all: 10),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                shrinkWrap: true,
                childAspectRatio: 120/90,
                children: List.generate(9, (index) {
                  return GridSampleContainerCard(title: 'Container ${index + 1}');
                }),
              ),
            )
          ],
        )
      ),
    );
  }
}