// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:trinity_lecture_app/presentation/pages/counter_app_page/counter_app_page.dart'
    as _i1;
import 'package:trinity_lecture_app/presentation/pages/dummy_ui_page/dummy_ui_first_page.dart'
    as _i2;
import 'package:trinity_lecture_app/presentation/pages/dummy_ui_page/dummy_ui_second_page.dart'
    as _i3;
import 'package:trinity_lecture_app/presentation/pages/main_page/main_page.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    CounterAppRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CounterAppPage(),
      );
    },
    DummyUIFirstRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DummyUIFirstPage(),
      );
    },
    DummyUISecondRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DummyUISecondPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CounterAppPage]
class CounterAppRoute extends _i5.PageRouteInfo<void> {
  const CounterAppRoute({List<_i5.PageRouteInfo>? children})
      : super(
          CounterAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterAppRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DummyUIFirstPage]
class DummyUIFirstRoute extends _i5.PageRouteInfo<void> {
  const DummyUIFirstRoute({List<_i5.PageRouteInfo>? children})
      : super(
          DummyUIFirstRoute.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIFirstRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DummyUISecondPage]
class DummyUISecondRoute extends _i5.PageRouteInfo<void> {
  const DummyUISecondRoute({List<_i5.PageRouteInfo>? children})
      : super(
          DummyUISecondRoute.name,
          initialChildren: children,
        );

  static const String name = 'DummyUISecondRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MainPage]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
