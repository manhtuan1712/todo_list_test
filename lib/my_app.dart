import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/navigation/navigation_center.dart';
import 'features/main/presentation/pages/main_screen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        title: '',
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        showSemanticsDebugger: false,
        onGenerateRoute: Navigation.generateRoute,
        home: MainScreen(),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child,
          );
        },
      ),
    );
  }
}
