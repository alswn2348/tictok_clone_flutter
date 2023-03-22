import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictok_clone_flutter/features/main_navigation/main_navigation_screen.dart';
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
        //텍스트 테마
        textTheme: Typography.blackCupertino,
        //splashColor: Colors.transparent,
        //highlightColor: Colors.transparent,

        //커서 테마
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A), //커서 색
          // selectionColor: Color(0xFFE9435A),
        ),

        //앱바 테마
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

        //텝바 테마
        tabBarTheme: TabBarTheme(
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
        ),

        //리스트타일테마
        listTileTheme: const ListTileThemeData(iconColor: Colors.black),

        scaffoldBackgroundColor: Colors.white,

        //메인 컬러
        primaryColor: const Color(0xFFE9435A),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,

        //커서 테마
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),

        //앱바 테마
        appBarTheme: AppBarTheme(
          color: Colors.grey.shade900,
        ),

        //바텀앱바 테마
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade900,
        ),

        //탭바테마
        tabBarTheme: const TabBarTheme(
          indicatorColor: Colors.white,
        ),

        scaffoldBackgroundColor: Colors.black,

        //메인 컬러
        primaryColor: const Color(0xFFE9435A),
      ),
      home: const MainNavigationScreen(),
    );
  }
}
