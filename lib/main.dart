import 'package:flutter/material.dart';
import 'package:tictok_clone_flutter/features/onboarding/interests_screen.dart';
import 'constants/sizes.dart';

void main() {
  runApp(const TicTokApp());
}

class TicTokApp extends StatelessWidget {
  const TicTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Clone',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            titleTextStyle: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color(0xFFE9435A)),
      home: const InterestsScreen(),
    );
  }
}
