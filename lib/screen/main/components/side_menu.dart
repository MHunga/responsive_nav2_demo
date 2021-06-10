import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/controllers/menu_controller.dart';
import 'package:web_demo/navigator/main_route_name.dart';
import 'package:web_demo/navigator/main_route_path.dart';
import 'package:web_demo/responsive.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
    required this.currentRoute,
    required this.callbackChangeRoute,
  }) : super(key: key);
  final String currentRoute;
  final CallbackChangeRoute callbackChangeRoute;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(child: Image.asset("assets/images/logo.png")),
            DrawerHeaderTile(
              title: "Dashboard",
              iconSrg: "assets/icons/menu_dashbord.svg",
              press: () {
                if (Responsive.isMobile(context)) {
                  Provider.of<MenuController>(context, listen: false)
                      .offDrawer();
                }
                callbackChangeRoute(MainRouteName.dashboard, null);
              },
              isSelected: currentRoute == MainRouteName.dashboard,
            ),
            DrawerHeaderTile(
              title: "Transaction",
              iconSrg: "assets/icons/menu_tran.svg",
              press: () {
                if (Responsive.isMobile(context)) {
                  Provider.of<MenuController>(context, listen: false)
                      .offDrawer();
                }
                callbackChangeRoute(MainRouteName.transaction, null);
              },
              isSelected: currentRoute == MainRouteName.transaction,
            ),
            DrawerHeaderTile(
              title: "Task",
              iconSrg: "assets/icons/menu_task.svg",
              press: () {
                if (Responsive.isMobile(context)) {
                  Provider.of<MenuController>(context, listen: false)
                      .offDrawer();
                }
                callbackChangeRoute(MainRouteName.task, null);
              },
              isSelected: currentRoute == MainRouteName.task,
            ),
            DrawerHeaderTile(
              title: "Document",
              iconSrg: "assets/icons/menu_doc.svg",
              press: () {
                if (Responsive.isMobile(context)) {
                  Provider.of<MenuController>(context, listen: false)
                      .offDrawer();
                }
                callbackChangeRoute(MainRouteName.document, null);
              },
              isSelected: currentRoute == MainRouteName.document,
            ),
            DrawerHeaderTile(
              title: "Store",
              iconSrg: "assets/icons/menu_store.svg",
              press: () {
                if (Responsive.isMobile(context)) {
                  Provider.of<MenuController>(context, listen: false)
                      .offDrawer();
                }
                callbackChangeRoute(MainRouteName.store, null);
              },
              isSelected: currentRoute == MainRouteName.store,
            ),
            DrawerHeaderTile(
              title: "Notification",
              iconSrg: "assets/icons/menu_notification.svg",
              press: () {
                if (Responsive.isMobile(context)) {
                  Provider.of<MenuController>(context, listen: false)
                      .offDrawer();
                }
                callbackChangeRoute(MainRouteName.notification, null);
              },
              isSelected: currentRoute == MainRouteName.notification,
            ),
            DrawerHeaderTile(
              title: "Profile",
              iconSrg: "assets/icons/menu_profile.svg",
              press: () {
                if (Responsive.isMobile(context)) {
                  Provider.of<MenuController>(context, listen: false)
                      .offDrawer();
                }
                callbackChangeRoute(MainRouteName.profile, null);
              },
              isSelected: currentRoute == MainRouteName.profile,
            ),
            DrawerHeaderTile(
              title: "Setting",
              iconSrg: "assets/icons/menu_setting.svg",
              press: () {
                if (Responsive.isMobile(context)) {
                  Provider.of<MenuController>(context, listen: false)
                      .offDrawer();
                }
                callbackChangeRoute(MainRouteName.setting, null);
              },
              isSelected: currentRoute == MainRouteName.setting,
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerHeaderTile extends StatelessWidget {
  final String title;
  final String iconSrg;
  final VoidCallback press;
  final bool isSelected;
  const DrawerHeaderTile({
    Key? key,
    required this.title,
    required this.iconSrg,
    required this.press,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      tileColor: isSelected ? Colors.white10 : Colors.transparent,
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
      leading: SvgPicture.asset(
        iconSrg,
        color: Colors.white54,
        height: 16,
      ),
    );
  }
}
