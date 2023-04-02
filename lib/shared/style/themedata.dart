
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData LightTheme = ThemeData(
  primarySwatch: Colors.grey,
  bottomNavigationBarTheme:BottomNavigationBarThemeData(
    unselectedItemColor: Colors.grey,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: Colors.black,
    selectedIconTheme: IconThemeData(
      color: Colors.black,
          size: 35,
    ),
    elevation: 20.0,
    type: BottomNavigationBarType.fixed,
  ) ,
  scaffoldBackgroundColor: Colors.white,//HexColor('333739') ,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor:  Colors.black,
    ),
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor:Colors.white ,
    elevation: 0,
    titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold
    ),
  ),
);