import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone_flutter/features/authentication/repository/authhentication_repo.dart';
import 'package:tictok_clone_flutter/features/onboarding/interests_screen.dart';
import 'package:tictok_clone_flutter/features/user/view_models/users_view_model.dart';
import 'package:tictok_clone_flutter/utils.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    final users = ref.read(usersProvider.notifier);
    state = await AsyncValue.guard(() async {
      final userCredential =
          await _authRepo.emailSignUp("alswn213@naver.com", "23a324a@24");
      await users.createUserProfile(userCredential);
    });
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.goNamed(InterestsScreen.routeName);
    }
    /* _authRepo.signUp(form["email"], form["password"]);
    state = const AsyncValue.data(null); */
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
