import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'SFProText',
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF6c5ce7),
  // cardColor: const Color(0xFF232328),
  hintColor: const Color(0xFFaeaeae),
  scaffoldBackgroundColor: const Color(0xFFf6faff),
  //primaryColorDark: const Color(0xff01463e),

  colorScheme: const ColorScheme.dark(
      //primary: Color(0xFF02B8A2),
      //error: Color(0xFFE84D4F),
      secondary: Color(0xFF65cff2),
      onSecondary: Color(0xFFdadfe7),
      surface: Color(0xFF0f1446),
      onSurface: Color(0xFFffffff),
      outline: Color(0xFF1f1f24),
      //tertiary: Color(0xFF7CCD8B),
      //onTertiary: Color(0xFF17e0bc),

      /*tertiaryContainer: Color(0xFFC98B3E),
      secondaryContainer: Color(0xFFEE6464),
      onTertiary: Color(0xFFD9D9D9),
      onSecondary: Color(0xFF00FEE1),
      onSecondaryContainer: Color(0xFFA8C5C1),
      onTertiaryContainer: Color(0xFF425956),
      onPrimaryContainer: Color(0xFF929494),
      primaryContainer: Color(0xFFFFA800),
      onSurface: Color(0xFFFFE6AD),
      onPrimary: Color(0xFF064A42)*/


  ),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: const Color(0xFF00735f))),

    textTheme: const TextTheme(
      displayLarge: TextStyle(fontWeight: FontWeight.w700,fontSize: 33,fontFamily: 'SFProText', color: Color(0xFF868686)),
      displayMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 24,fontFamily: 'SFProText', color: Color(0xFF868686)),
      displaySmall: TextStyle(fontWeight: FontWeight.w400,fontSize: 26,fontFamily: 'SFProText', color: Color(0xFF868686)),

      titleLarge: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,fontFamily: 'SFProText', color: Color(0xFF868686)),
      titleMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,fontFamily: 'SFProText', color: Color(0xFF868686)),
      titleSmall: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,fontFamily: 'SFProText', color: Color(0xFF868686)),

    )
);
