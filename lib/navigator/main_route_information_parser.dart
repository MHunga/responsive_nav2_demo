import 'package:flutter/material.dart';
import 'package:web_demo/navigator/main_route_path.dart';

import 'main_route_name.dart';

class MainRouteInformationParser extends RouteInformationParser<MainRoutePath> {
  @override
  Future<MainRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    // Handle '/'
    if (uri.pathSegments.length == 0) {
      return MainRoutePath.dashboard();
    }
    // Handle '/segment'
    if (uri.pathSegments.length == 1) {
      print(uri.pathSegments[0]);
      String routeName = "/${uri.pathSegments[0]}";
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
          return MainRoutePath.unknown();
      }
    }

    return MainRoutePath.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(MainRoutePath path) {
    return RouteInformation(location: path.routeName);
  }
}
