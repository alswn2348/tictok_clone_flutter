import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictok_clone_flutter/features/authentication/sign_up_screen.dart';
import 'constants/sizes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //플러터 엔진 초기화

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]); //세로모드 고정

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark); //상태바 색깔 변경

  runApp(const TicTokApp());
}

class TicTokApp extends StatelessWidget {
  const TicTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clone',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        //splashColor: Colors.transparent,
        //highlightColor: Colors.transparent,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
          // selectionColor: Color(0xFFE9435A),
        ),
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
        primaryColor: const Color(0xFFE9435A),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFFE9435A),
      ),
      home: const SignUpScreen(),
    );
  }
}
