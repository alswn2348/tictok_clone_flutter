import 'package:flutter/material.dart';
import 'features/widgets/sign_up_screen.dart';

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
      theme: ThemeData(primaryColor: const Color(0xFFE9435A)),
      home: const SignUpScreen(),
    );
  }
}
