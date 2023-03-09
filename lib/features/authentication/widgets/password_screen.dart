import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone_flutter/constants/gaps.dart';
import 'package:tictok_clone_flutter/constants/sizes.dart';
import 'package:tictok_clone_flutter/features/authentication/widgets/birthdaty_screen.dart';

import 'form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = '';

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();

    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty &&
        _ispasswordLengthValid() &&
        _isPasswordFormValid();
  }

  bool _isPasswordFormValid() {
    final regExp = RegExp(
        r"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@$!%*#?&\^])[A-Za-z0-9@$!%*#?&\^]{9,}$");
    if (regExp.hasMatch(_password)) {
      return true;
    }
    return false;
  }

  bool _ispasswordLengthValid() {
    return _password.isNotEmpty &&
        _password.length > 8 &&
        _password.length < 20;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Birthdayscreen(),
      ),
    );
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign up',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Gaps.v40,
            const Text(
              'Password',
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v16,
            TextField(
              obscureText: _obscureText,
              controller: _passwordController,
              autocorrect: false,
              onEditingComplete: _onSubmit,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: _onClearTap,
                      child: FaIcon(
                        FontAwesomeIcons.solidCircleXmark,
                        color: Colors.grey.shade400,
                        size: Sizes.size20,
                      ),
                    ),
                    Gaps.h16,
                    GestureDetector(
                      onTap: _toggleObscureText,
                      child: FaIcon(
                        _obscureText
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        color: Colors.grey.shade400,
                        size: Sizes.size20,
                      ),
                    ),
                  ],
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
            ),
            Gaps.v10,
            const Text(
              'Your password must have:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Gaps.v10,
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.circleCheck,
                  size: Sizes.size20,
                  color: _ispasswordLengthValid()
                      ? Colors.green
                      : Colors.grey.shade400,
                ),
                Gaps.h5,
                const Text("8 to 20 characters")
              ],
            ),
            Gaps.v10,
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.circleCheck,
                  size: Sizes.size20,
                  color: _isPasswordFormValid()
                      ? Colors.green
                      : Colors.grey.shade400,
                ),
                Gaps.h5,
                const Text("Latters, numbers, and special charcters")
              ],
            ),
            Gaps.v28,
            GestureDetector(
                onTap: _onSubmit,
                child: FormButton(disabled: !_isPasswordValid()))
          ]),
        ),
      ),
    );
  }
}
