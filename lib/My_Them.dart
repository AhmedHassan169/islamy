import 'package:flutter/material.dart';

class MyThem {
  static final Color primary_color =
      Color(0xFFB7935F); //اللى هو الجولد اللى فى الفيديو
  static final Color color_yello = Color(0xFFFACC1D);
  static final Color color_dark_blue = Color(0xFF141A2E);

  static final ThemeData light_them = ThemeData(
      primaryColor: primary_color,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.transparent,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
      textTheme: const TextTheme(
        // هنا بحط  الخصائص اللى عايزها وامررها هنا فى الدراك نفس الاسم
        // واستدهعيها مره واحده عند الويتجت وهو يغيرها
        headline4: TextStyle(fontSize: 28, color: Colors.black),
        headline5: TextStyle(fontSize: 24, color: Colors.black),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primary_color,
        selectedIconTheme: const IconThemeData(
            size: 30, // خصائص الايقون
            color: Colors.black),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: Colors.black, // لون الكلام
        unselectedItemColor: Colors.white,
      ));

  static final ThemeData Dark_them = ThemeData(
      primaryColor: color_yello,
      scaffoldBackgroundColor: Colors.transparent,
      backgroundColor: color_dark_blue,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: color_dark_blue),
      textTheme: const TextTheme(
          headline4: TextStyle(fontSize: 28, color: Colors.white),
          headline5: TextStyle(fontSize: 24, color: Colors.white)),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: color_dark_blue,
        selectedIconTheme: IconThemeData(
          size: 30, // خصائص الايقون
          color: color_yello,
        ),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: color_yello, // لون الكلام

        unselectedItemColor: Colors.white,
      ));
}
