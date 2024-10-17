import 'package:navigation/navigation/navigation_helper.dart';

abstract class TaskRouter {}

class TaskRouterImpl extends TaskRouter {
  final NavigationHelper navigationHelper;

  TaskRouterImpl({
    required this.navigationHelper,
  });
}
