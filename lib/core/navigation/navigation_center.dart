import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list/features/main/presentation/pages/main_screen.dart';

class Navigation {
  static const String MAIN_SCREEN = "/main-screen";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MAIN_SCREEN:
        return MaterialPageRoute(builder: (_) => MainScreen(), settings: RouteSettings(name: MAIN_SCREEN));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
