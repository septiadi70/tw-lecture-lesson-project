import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:trinity_lecture_app/domain/main_page/entities/home_menu_model.dart';
import 'package:trinity_lecture_app/presentation/widgets/molecules/action_text.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: UIHelper.padding(all: 20),
        child: ListView.builder(
          itemCount: HomeMenuModel.getHomePageMenus().length,
          itemBuilder: (context, index) {
            final menu = HomeMenuModel.getHomePageMenus()[index];
            return ActionText(
              onTap: () {
                if (menu.routePath != null) AutoRouter.of(context).push(menu.routePath!);
              }, 
              title: menu.title, 
              desc: menu.desc,
            );
          },
        ),
      )
    );
  }
}