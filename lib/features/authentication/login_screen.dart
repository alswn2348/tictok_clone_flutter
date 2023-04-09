import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone_flutter/constants/gaps.dart';
import 'package:tictok_clone_flutter/constants/sizes.dart';
import 'package:tictok_clone_flutter/features/authentication/login_form_screen.dart';
import 'package:tictok_clone_flutter/features/authentication/sign_up_screen.dart';
import 'package:tictok_clone_flutter/features/authentication/view_models/social_auth_ciew_model.dart';
import 'package:tictok_clone_flutter/utils.dart';

import 'widgets/auth_button.dart';

class LoginScreen extends ConsumerWidget {
  static String routeName = "login";
  static String routeURL = "/login";
  const LoginScreen({super.key});

  void onSignupTap(BuildContext context) {
    context.pop(SignUpScreen.routeName);
  }

  void _onEmailLoginTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginFormScreen(),
      ),
    );
  }

  void _onGithubSignTap(BuildContext context, WidgetRef ref) {
    ref.read(socialAuthProvider.notifier).githubSingIn(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(children: [
            Gaps.v80,
            const Text(
              'Log in to tictok',
              style: TextStyle(
                  fontSize: Sizes.size24, fontWeight: FontWeight.w700),
            ),
            Gaps.v20,
            const Opacity(
              opacity: 0.7,
              child: Text(
                'Manage your account, check notifications, comment on videos, and more.',
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Gaps.v40,
            GestureDetector(
              onTap: () => _onEmailLoginTap(context),
              child: const AuthButton(
                text: 'Use email & passward',
                icon: FaIcon(FontAwesomeIcons.user),
              ),
            ),
            Gaps.v16,
            GestureDetector(
              onTap: () => _onGithubSignTap(context, ref),
              child: const AuthButton(
                text: 'Continue with Github',
                icon: FaIcon(FontAwesomeIcons.github),
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: isDarkMode(context) ? null : Colors.grey.shade50,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account?'),
              Gaps.h5,
              GestureDetector(
                onTap: () => onSignupTap(context),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
