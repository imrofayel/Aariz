import 'package:flutter/material.dart';

class Themes {

  static ThemeData lightTheme = ThemeData(

    useMaterial3: true,

    fontFamily: "Inter",

    textTheme: const TextTheme(

      bodyMedium: TextStyle(color: Color.fromRGBO(43, 43, 43, 1)),
      
      bodyLarge: TextStyle(color: Color.fromRGBO(43, 43, 43, 1)),

      bodySmall: TextStyle(color: Color.fromRGBO(43, 43, 43, 1)),

    ),

    colorScheme: ColorScheme.fromSeed(

      brightness: Brightness.light,

      seedColor: Colors.green,

      background: const Color.fromRGBO(218, 218, 218, 1),

      secondary: const Color.fromRGBO(197, 197, 197, 1),

      primary: const Color.fromRGBO(229, 229, 229, 1),

      primaryContainer: const Color.fromRGBO(240, 127, 104, 1),

      secondaryContainer: const Color.fromRGBO(69, 185, 146, 1),

      tertiaryContainer: const Color.fromARGB(255, 215, 239, 95),

      tertiary: const Color.fromRGBO(43, 43, 43, 1),

    ),

    appBarTheme: const AppBarTheme(

      backgroundColor: Colors.transparent,
      
      elevation: 0,

      iconTheme: IconThemeData(size: 32),

      shadowColor: Colors.transparent,

      actionsIconTheme: IconThemeData(size: 34),

      toolbarHeight: 80,
    ),
  );

  static ThemeData darkTheme = ThemeData(

    useMaterial3: true,

    fontFamily: "Inter",

    textTheme: const TextTheme(

      bodyMedium: TextStyle(color: Color.fromRGBO(192, 212, 190, 1)),
      
      bodyLarge: TextStyle(color: Color.fromRGBO(192, 212, 190, 1)),

      bodySmall: TextStyle(color: Color.fromRGBO(192, 212, 190, 1)),

    ),

    colorScheme: ColorScheme.fromSeed(

      brightness: Brightness.dark,

      seedColor: Colors.green,

      background: const Color.fromRGBO(40, 47, 40, 1),

      secondary: const Color.fromRGBO(46, 66, 52, 1),

      primary: const Color.fromRGBO(45, 63, 50, 1),

      primaryContainer: const Color.fromARGB(255, 212, 106, 85),

      secondaryContainer: const Color.fromRGBO(33, 150, 115, 1),

      tertiaryContainer: const Color.fromARGB(255, 215, 239, 95),

      tertiary: const Color.fromRGBO(192, 212, 190, 1),

    ),

    appBarTheme: const AppBarTheme(

      backgroundColor: Colors.transparent,
      
      elevation: 0,

      iconTheme: IconThemeData(size: 32),

      shadowColor: Colors.transparent,

      actionsIconTheme: IconThemeData(size: 34),

      toolbarHeight: 80,
    ),
  );
}