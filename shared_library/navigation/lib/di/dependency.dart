import 'package:navigation/navigation/navigation_helper.dart';
import 'package:navigation/router/task_router.dart';
import 'package:shared_library/di/di.dart';

class NavigationDependency {
  NavigationDependency() {
    _registerNavigation();
    _registerRouter();
  }

  void _registerNavigation() => locator.registerLazySingleton<NavigationHelper>(
        () => NavigationHelperImpl(),
      );

  void _registerRouter() => locator.registerLazySingleton<TaskRouter>(
        () => TaskRouterImpl(
          navigationHelper: locator(),
        ),
      );
}
