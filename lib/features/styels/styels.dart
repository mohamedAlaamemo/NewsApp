import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightmode=ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme:const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle:  TextStyle(color: Colors.black),
      iconTheme:  IconThemeData(color: Colors.black,size: 30.0)
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      backgroundColor: Colors.white12,
      elevation: 20.0
  ),
  textTheme: const TextTheme(
    bodyText1:  TextStyle(
        fontSize: 20.0,
        color: Colors.black
    ),
  ),
);
ThemeData darkmode=ThemeData(
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:HexColor('333739'),
          statusBarIconBrightness: Brightness.light
      ),
      backgroundColor: HexColor('333739'),
      elevation: 0.0,
      titleTextStyle:  TextStyle(color: Colors.white),
      iconTheme:  IconThemeData(color: Colors.white,size: 30.0)

  ),
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    backgroundColor: HexColor('333739'),
    elevation: 20.0,
    unselectedItemColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyText1:  TextStyle(
        fontSize: 20.0,
        color: Colors.white
    ),
  ),

);