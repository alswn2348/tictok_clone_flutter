import 'package:go_router/go_router.dart';
import 'package:tictok_clone_flutter/features/authentication/email_screen.dart';
import 'package:tictok_clone_flutter/features/authentication/login_screen.dart';
import 'package:tictok_clone_flutter/features/authentication/sign_up_screen.dart';
import 'package:tictok_clone_flutter/features/authentication/username_screen.dart';
import 'package:tictok_clone_flutter/features/user/user_profile_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: UsernameScreen.routeName,
      builder: (context, state) => const UsernameScreen(),
    ),
    GoRoute(
      path: EmailScreen.routeName,
      builder: (context, state) {
        final args = state.extra as EmailScreenArgs;
        return EmailScreen(username: args.userName);
      },
    ),
    GoRoute(
      path: "/users/:username",
      builder: (context, state) {
        final username = state.params['username'];
        final tab = state.queryParams['show'];

        if (tab != null) {
          return UserProfileScreen(username: username!, tab: tab);
        }
        return UserProfileScreen(username: username!);
      },
    ),
  ],
);
