import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/controllers/menu_controller.dart';
import 'package:web_demo/navigator/main_route_name.dart';
import 'package:web_demo/navigator/main_route_path.dart';
import 'package:web_demo/navigator/no_animation_transition_delegate.dart';
import 'package:web_demo/responsive.dart';
import 'package:web_demo/screen/dashboard/dashboard_screen.dart';
import 'package:web_demo/screen/document/document_screen.dart';
import 'package:web_demo/screen/notification/notification_screen.dart';
import 'package:web_demo/screen/profile/profile_screen.dart';
import 'package:web_demo/screen/setting/setting_screen.dart';
import 'package:web_demo/screen/store/store_screen.dart';
import 'package:web_demo/screen/task/task_screen.dart';
import 'package:web_demo/screen/transaction/transaction_screen.dart';
import 'package:web_demo/screen/unknown/unknown_screen.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  final String routeName;
  final CallbackChangeRoute callbackChangeRoute;
  final Key navigatorKey;
  final bool Function(Route<dynamic>, dynamic)? onPopPage;
  MainScreen(
      {Key? key,
      required this.routeName,
      required this.callbackChangeRoute,
      required this.navigatorKey,
      this.onPopPage})
      : super(key: key);

  final TransitionDelegate transitionDelegate = NoAnimationTransitionDelegate();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().homeScaffoldKey,
      drawer: Responsive.isWeb(context)
          ? null
          : SideMenu(
              callbackChangeRoute: callbackChangeRoute,
              currentRoute: routeName,
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isWeb(context))
              Expanded(
                  child: SideMenu(
                callbackChangeRoute: callbackChangeRoute,
                currentRoute: routeName,
              )),
            Expanded(
                flex: 5,
                child: Navigator(
                  key: navigatorKey,
                  transitionDelegate: Responsive.isWeb(context)
                      ? transitionDelegate
                      : DefaultTransitionDelegate(),
                  pages: [
                    if (routeName == MainRouteName.dashboard)
                      MaterialPage(
                          key: ValueKey("Dashboard"), child: DashboardScreen()),
                    if (routeName == MainRouteName.transaction)
                      MaterialPage(
                          key: ValueKey("Transaction"),
                          child: TransactionScreen()),
                    if (routeName == MainRouteName.task)
                      MaterialPage(key: ValueKey("Task"), child: TaskScreen()),
                    if (routeName == MainRouteName.document)
                      MaterialPage(
                          key: ValueKey("Document"), child: DocumentScreen()),
                    if (routeName == MainRouteName.store)
                      MaterialPage(
                          key: ValueKey("Store"), child: StoreScreen()),
                    if (routeName == MainRouteName.notification)
                      MaterialPage(
                          key: ValueKey("Notification"),
                          child: NotificationScreen()),
                    if (routeName == MainRouteName.profile)
                      MaterialPage(
                          key: ValueKey("Profile"), child: ProfileScreen()),
                    if (routeName == MainRouteName.setting)
                      MaterialPage(
                          key: ValueKey("Setting"), child: SettingScreen()),
                    if (routeName == MainRouteName.unknown)
                      MaterialPage(
                          key: ValueKey("Unknown"), child: UnknownScreen()),
                  ],
                  onPopPage: onPopPage,
                ))
          ],
        ),
      ),
    );
  }
}
