import 'package:flutter/material.dart';
import 'package:tictok_clone_flutter/constants/gaps.dart';

import '../../constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(children: const [
            Gaps.v80,
            Text(
              'Sign up for tictok',
              style: TextStyle(
                  fontSize: Sizes.size24, fontWeight: FontWeight.w700),
            ),
            Gaps.v20,
            Text(
              'Create a profile, follow other accounts, make your own videos, and more.',
              style: TextStyle(fontSize: Sizes.size16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade100,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Aleady have an account?'),
              Gaps.h5,
              Text(
                'Login',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
