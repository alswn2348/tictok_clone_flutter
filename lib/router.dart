import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone_flutter/common/main_navigation/main_navigation_screen.dart';
import 'package:tictok_clone_flutter/features/authentication/login_screen.dart';
import 'package:tictok_clone_flutter/features/authentication/sign_up_screen.dart';
import 'package:tictok_clone_flutter/features/inbox/activity_screen.dart';
import 'package:tictok_clone_flutter/features/inbox/chat_detail_screen.dart';
import 'package:tictok_clone_flutter/features/inbox/chats_screen.dart';
import 'package:tictok_clone_flutter/features/onboarding/interests_screen.dart';

import 'features/videos/views/video_recording_screen.dart';

final router = GoRouter(
  initialLocation: "/inbox",
  routes: [
    GoRoute(
      path: SignUpScreen.routeURL,
      name: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeURL,
      name: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: InterestsScreen.routeURL,
      name: InterestsScreen.routeName,
      builder: (context, state) => const InterestsScreen(),
    ),
    GoRoute(
      path: "/:tab(home|discover|inbox|profile)",
      name: MainNavigationScreen.routeName,
      builder: (context, state) {
        final tab = state.params["tab"]!;
        return MainNavigationScreen(
          tab: tab,
        );
      },
    ),
    GoRoute(
      path: ActivityScreen.routeURL,
      name: ActivityScreen.routeName,
      builder: (context, state) => const ActivityScreen(),
    ),
    GoRoute(
      path: ChatsScreen.routeURL,
      name: ChatsScreen.routeName,
      builder: (context, state) => const ChatsScreen(),
      routes: [
        GoRoute(
          path: ChatDetailScreen.routeURL,
          name: ChatDetailScreen.routeName,
          builder: (context, state) {
            final chatId = state.params["chatId"]!;
            return ChatDetailScreen(
              chatId: chatId,
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: VideoRecordingScreen.routeURL,
      name: VideoRecordingScreen.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const VideoRecordingScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final position = Tween(begin: const Offset(0, 1), end: Offset.zero)
              .animate(animation);
          return SlideTransition(position: position, child: child);
        },
      ),
    ),
  ],
);
