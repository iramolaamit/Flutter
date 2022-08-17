import 'package:flutter/material.dart';
import 'package:untitled/screen/loginPage.dart';
import 'package:untitled/utils/routes.dart';
import 'package:untitled/widets/themes.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: LoginPage(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: MyTheme.lightThemeData(context),
        darkTheme: MyTheme.darkTheme(context),
        initialRoute: MyRoutes.homeRoute,
        routes: {
          // "/": (context) => LoginPage(),
          // home screen or default route
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
        });
  }
}