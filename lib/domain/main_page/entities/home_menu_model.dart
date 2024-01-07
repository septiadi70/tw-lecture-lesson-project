import 'package:auto_route/auto_route.dart';
import 'package:trinity_lecture_app/core/routes/app_router.gr.dart';

class HomeMenuModel {
  final String title;
  final String desc;
  final PageRouteInfo? routePath;

  const HomeMenuModel({
    required this.title, 
    required this.desc, 
    this.routePath
  });

  static List<HomeMenuModel> getHomePageMenus() {
    return [
      const HomeMenuModel(title: 'Dummy UI', desc: 'Introducing basic flutter widget UI', routePath: DummyUIFirstRoute()),
      const HomeMenuModel(title: 'Counter Example (State Management)', desc: 'Introducing of state management using flutter_bloc. Level: 1', routePath: CounterAppRoute()),
      const HomeMenuModel(title: 'Input Validation Example (State Management)', desc: 'Flutter state management using flutter_bloc to handle validation in text field. Level: 2', routePath: InputValidationRoute()),
      const HomeMenuModel(title: 'Calculator Example (State Management)', desc: 'Flutter state management using flutter_bloc to calculate simple syntax. Level 3', routePath: SimpleCalculatorRoute()),
      const HomeMenuModel(title: 'News App', desc: 'API calling using free source from NYTimes', routePath: NewsAppRoute()),
      const HomeMenuModel(title: 'To Do App', desc: 'Create a to do list that saved in local storage using hydrated_bloc. Level: 4'),
    ];
  }
}