import 'package:auto_route/auto_route.dart';
import 'package:trinity_lecture_app/core/routes/app_router.gr.dart';
import 'package:trinity_lecture_app/presentation/pages/home_page.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, initial: false),
    AutoRoute(page: HomeRoute.page, initial: true, path: '/home'),
    AutoRoute(page: DummyRoute.page, path: '/dummy'),
    AutoRoute(page: DummySecondRoute.page, path: '/dummySecond')
  ];
}
