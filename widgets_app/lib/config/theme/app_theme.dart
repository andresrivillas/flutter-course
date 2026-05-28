import 'package:flutter/material.dart';

const colorList = [
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkmode;

  AppTheme({this.selectedColor = 2, this.isDarkmode = false})
    : assert(selectedColor >= 0, "Selected color must be greather then 0"),
      assert(selectedColor < colorList.length);

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkmode? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: AppBarTheme(centerTitle: false),
  );
}
