import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/constants.dart';
import 'package:web_demo/controllers/menu_controller.dart';

import 'navigator/main_route_information_parser.dart';
import 'navigator/main_router_delegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MainRouterDelegate _routerDelegate = MainRouterDelegate();
  final MainRouteInformationParser _routeInformationParser =
      MainRouteInformationParser();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MenuController())],
      child: MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: bgColor,
              textTheme: GoogleFonts.poppinsTextTheme(
                  Theme.of(context).textTheme.apply(bodyColor: Colors.white)),
              canvasColor: secondaryColor),
          routeInformationParser: _routeInformationParser,
          routerDelegate: _routerDelegate),
    );
  }
}
