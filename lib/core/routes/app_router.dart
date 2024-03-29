import 'package:auto_route/auto_route.dart';
import 'package:trinity_lecture_app/core/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: MainRoute.page, initial: true),
    AutoRoute(page: DummyUIFirstRoute.page),
    AutoRoute(page: DummyUISecondRoute.page),
    AutoRoute(page: CounterAppRoute.page),
    AutoRoute(page: InputValidationRoute.page),
    AutoRoute(page: SimpleCalculatorRoute.page),
    AutoRoute(page: NewsAppRoute.page),
    AutoRoute(page: NewsAppPopularRoute.page),
    AutoRoute(page: NewsAppTopStoriesRoute.page),
  ];
}
