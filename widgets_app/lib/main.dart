import 'package:flutter/material.dart';
import 'package:widgets_app/config/presentation/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/config/presentation/screens/cards/cards_screen.dart';
import 'package:widgets_app/config/presentation/screens/home/home_screen.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 1).getTheme(),
        home: const HomeScreen(),
        routes: {
          '/buttons': (context) => const ButtonScreen(),
          '/cards': (context) => const CardsScreen()
        },);
  }
}
