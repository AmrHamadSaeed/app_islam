import 'package:flutter/material.dart';

class MyTheme{
  /// colors , light mode , dark mode
  static Color blackColor = Color(0xff242424);
  static Color primaryLightColorBottom = Color(0xffB7935F);
  static Color whiteColor = Color(0xffffffff);
  static Color primaryDarkColorBottom = Color(0xff141A2E);
  static Color yellowColor = Color(0xffFACC1D);
  static ThemeData lightMode = ThemeData(
    primaryColor: primaryLightColorBottom,
     scaffoldBackgroundColor: Colors.transparent,
     appBarTheme: AppBarTheme(
       iconTheme: IconThemeData(
         color: blackColor,
       ),
       backgroundColor: Colors.transparent,
       elevation: 0,
       centerTitle: true,
     ),
     textTheme: TextTheme(
       titleSmall: TextStyle(
         fontSize: 25,
         fontWeight: FontWeight.w400,
         color: blackColor,
       ),
       titleMedium: TextStyle(
         fontSize: 25,
         fontWeight: FontWeight.w400,
         color: blackColor,
       ),
       titleLarge: TextStyle(
         fontSize: 30.0,
         fontWeight: FontWeight.bold,
         color: blackColor,
       ),
     ),
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
       selectedItemColor: blackColor,

     ),
   );
  static ThemeData darkMode = ThemeData(
    primaryColor: primaryDarkColorBottom,
     scaffoldBackgroundColor: Colors.transparent,
     appBarTheme: AppBarTheme(
       iconTheme: IconThemeData(
         color: whiteColor,
       ),
       backgroundColor: Colors.transparent,
       elevation: 0,
       centerTitle: true,
     ),
     textTheme: TextTheme(
       titleSmall: TextStyle(
         fontSize: 25,
         fontWeight: FontWeight.w400,
         color: yellowColor,
       ),
       titleMedium: TextStyle(
         fontSize: 25,
         fontWeight: FontWeight.w400,
         color: yellowColor,
       ),
       titleLarge: TextStyle(
         fontSize: 30.0,
         fontWeight: FontWeight.bold,
         color: yellowColor,
       ),
     ),
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
       selectedItemColor: yellowColor,

     ),
   );

}