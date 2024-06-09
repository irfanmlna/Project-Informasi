import 'package:project_informasi/screen_page/about_us_screen.dart';
import 'package:project_informasi/screen_page/home_screen.dart';
import 'package:project_informasi/screen_page/penyuluhan_hukum_screen.dart';
import 'package:project_informasi/screen_page/penyuluhan_list_screen.dart';
import 'package:project_informasi/screen_page/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
