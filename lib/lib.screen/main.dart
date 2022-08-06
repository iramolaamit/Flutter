import 'package:flutter/material.dart';
import 'package:untitled/lib.screen/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // home: HomePage(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          // fontFamily: GoogleFonts.lato().fontFamily ,
          // primaryTextTheme: GoogleFonts.latoTextTheme(),

          primarySwatch: Colors.deepPurple,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
        ),
        initialRoute: "/home",
        routes: {
          "/": (context) => LoginPage(),
          // home screen or default route
          "/home": (context) => LoginPage(),
          "/Login": (context) => LoginPage(),
        });
  }
}
