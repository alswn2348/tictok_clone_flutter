import 'package:go_router/go_router.dart';
import 'package:tictok_clone_flutter/features/authentication/email_screen.dart';
import 'package:tictok_clone_flutter/features/authentication/sign_up_screen.dart';
import 'package:tictok_clone_flutter/features/authentication/username_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
        name: SignUpScreen.routeName,
        path: SignUpScreen.routeURL,
        builder: (context, state) => const SignUpScreen(),
        routes: [
          GoRoute(
              path: UsernameScreen.routeURL,
              name: UsernameScreen.routeName,
              builder: (context, state) => const UsernameScreen(),
              routes: [
                GoRoute(
                  path: EmailScreen.routeURL,
                  name: EmailScreen.routeName,
                  builder: (context, state) {
                    final args = state.extra as EmailScreenArgs;
                    return EmailScreen(username: args.userName);
                  },
                ),
              ]),
        ]),
    /*    GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ), */
    /* GoRoute(
      name: "username_screen",
      path: UsernameScreen.routeName,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const UsernameScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
        );
      },
    ), */
/* 
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
    ), */
  ],
);
