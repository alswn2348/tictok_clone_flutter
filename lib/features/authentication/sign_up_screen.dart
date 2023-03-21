import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone_flutter/constants/gaps.dart';
import 'package:tictok_clone_flutter/features/authentication/widgets/auth_button.dart';
import 'package:tictok_clone_flutter/utils.dart';

import '../../../constants/sizes.dart';
import 'login_screen.dart';
import 'username_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UsernameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
              child: Column(children: [
                Gaps.v80,
                const Text(
                  'Sign up for tictok',
                  style: TextStyle(
                      fontSize: Sizes.size24, fontWeight: FontWeight.w700),
                ),
                Gaps.v20,
                const Opacity(
                  opacity: 0.7,
                  child: Text(
                    'Create a profile, follow other accounts, make your own videos, and more.',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Gaps.v40,
                if (orientation == Orientation.portrait) ...[
                  GestureDetector(
                    onTap: () => _onEmailTap(context),
                    child: const AuthButton(
                      text: 'Use email & password',
                      icon: FaIcon(FontAwesomeIcons.user),
                    ),
                  ),
                  Gaps.v16,
                  const AuthButton(
                    text: 'Continue with Apple',
                    icon: FaIcon(FontAwesomeIcons.apple),
                  ),
                ],
                if (orientation == Orientation.landscape)
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _onEmailTap(context),
                          child: const AuthButton(
                            text: 'Use email & password',
                            icon: FaIcon(FontAwesomeIcons.user),
                          ),
                        ),
                      ),
                      Gaps.v16,
                      const Expanded(
                        child: AuthButton(
                          text: 'Continue with Apple',
                          icon: FaIcon(FontAwesomeIcons.apple),
                        ),
                      ),
                    ],
                  )
              ]),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: isDarkMode(context)
                ? Colors.grey.shade900
                : Colors.grey.shade50,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Aleady have an account?'),
                  Gaps.h5,
                  GestureDetector(
                    onTap: () => onLoginTap(context),
                    child: Text(
                      'Login',
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
      },
    );
  }
}
