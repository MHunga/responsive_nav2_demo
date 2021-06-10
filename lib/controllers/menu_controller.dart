import 'package:flutter/material.dart';

class MenuController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();

  void showDrawer() {
    if (!homeScaffoldKey.currentState!.isDrawerOpen) {
      homeScaffoldKey.currentState?.openDrawer();
    }
  }

  void offDrawer() {
    if (homeScaffoldKey.currentState!.isDrawerOpen) {
      homeScaffoldKey.currentState?.openEndDrawer();
    }
  }
}
