import 'package:flutter/material.dart';
//https://www.bilibili.com/video/BV194411Z7Ep

enum AppTheme {
  GreenLight,
  GreenDark,
  BlueLight,
  BlueDark,
}

final appThemeData = {
  AppTheme.GreenLight:
      ThemeData(brightness: Brightness.light, primaryColor: Colors.green),
  AppTheme.GreenDark: ThemeData(
      brightness: Brightness.dark, primaryColor: Colors.green[700]), //阴影默认500
  AppTheme.BlueLight: ThemeData(
      brightness: Brightness.light, primaryColor: Colors.blue), //阴影默认500
  AppTheme.BlueDark: ThemeData(
      brightness: Brightness.dark, primaryColor: Colors.blue[700]) //阴影默认500
};
