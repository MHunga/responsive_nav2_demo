import 'package:web_demo/navigator/main_route_name.dart';

typedef CallbackChangeRoute(String route, [Object? object]);

class MainRoutePath {
  final String routeName;

  MainRoutePath.dashboard() : routeName = MainRouteName.dashboard;
  MainRoutePath.transaction() : routeName = MainRouteName.transaction;
  MainRoutePath.task() : routeName = MainRouteName.task;
  MainRoutePath.document() : routeName = MainRouteName.document;
  MainRoutePath.store() : routeName = MainRouteName.store;
  MainRoutePath.notification() : routeName = MainRouteName.notification;
  MainRoutePath.profile() : routeName = MainRouteName.profile;
  MainRoutePath.setting() : routeName = MainRouteName.setting;
  MainRoutePath.unknown() : routeName = MainRouteName.unknown;
}
