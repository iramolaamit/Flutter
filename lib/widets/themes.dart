import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightThemeData(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        cardColor: Colors.white,
        canvasColor: creamColor,
        buttonColor: lightBlueColor,
        accentColor: darkBlueColor,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          textTheme: Theme.of(context).textTheme.copyWith(
              headline6:
                  context.textTheme.headline6?.copyWith(color: Colors.black)),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        // backgroundColor: context.cardColor,
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        cardColor: Colors.black,
        buttonColor: lightBlueColor,
        canvasColor: darkcreamColor,
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme.copyWith(
              headline6:
                  context.textTheme.headline6?.copyWith(color: Colors.white)),
        ),
      );
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = Color(0xFF1f2937);
  static Color darkBlueColor = Color(0xff403b58);
  static Color lightBlueColor = Color(0xFF6366F1);
}
