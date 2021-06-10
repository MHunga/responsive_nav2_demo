import 'package:flutter/material.dart';
import 'package:web_demo/navigator/main_route_name.dart';
import 'package:web_demo/navigator/main_route_path.dart';
import 'package:web_demo/screen/main/main_screen.dart';

class MainRouterDelegate extends RouterDelegate<MainRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MainRoutePath> {
  final GlobalKey<NavigatorState> _navigatorKey;
  String routeName = MainRouteName.dashboard;
  MainRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  MainRoutePath get currentConfiguration {
    switch (routeName) {
      case MainRouteName.dashboard:
        return MainRoutePath.dashboard();
      case MainRouteName.transaction:
        return MainRoutePath.transaction();
      case MainRouteName.task:
        return MainRoutePath.task();
      case MainRouteName.document:
        return MainRoutePath.document();
      case MainRouteName.store:
        return MainRoutePath.store();
      case MainRouteName.notification:
        return MainRoutePath.notification();
      case MainRouteName.profile:
        return MainRoutePath.profile();
      case MainRouteName.setting:
        return MainRoutePath.setting();
      case MainRouteName.unknown:
        return MainRoutePath.unknown();
      default:
        return MainRoutePath.dashboard();
    }
  }

  _handleTapped(String route, [Object? object]) {
    routeName = route;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      routeName: routeName,
      callbackChangeRoute: _handleTapped,
      navigatorKey: _navigatorKey,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          print("pop");
          return false;
        }
        print(route.settings.name);

        routeName = route.settings.name!;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(MainRoutePath path) async {
    if (path.routeName != MainRouteName.dashboard &&
        path.routeName != MainRouteName.transaction &&
        path.routeName != MainRouteName.task &&
        path.routeName != MainRouteName.document &&
        path.routeName != MainRouteName.store &&
        path.routeName != MainRouteName.notification &&
        path.routeName != MainRouteName.profile &&
        path.routeName != MainRouteName.setting) {
      routeName = MainRouteName.unknown;
      return;
    } else {
      routeName = path.routeName;
      return;
    }
  }
}
