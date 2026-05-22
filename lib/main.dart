import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'theme/app_theme.dart';
import 'pages/detail_page.dart';
import 'pages/favorite_page.dart';
import 'pages/setting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AssetBox',
      theme: AppTheme.darkTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/detail': (context) => const DetailPage(),
        '/favorite': (context) => const FavoritePage(),
         '/setting': (context) => const SettingPage(),
        
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
