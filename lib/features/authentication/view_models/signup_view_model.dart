import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone_flutter/features/authentication/repository/authhentication_repo.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp() async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    AsyncValue.guard(
      () async => await _authRepo.emailSignUp(
        form["email"],
        form["password"],
      ),
    );

    /* _authRepo.signUp(form["email"], form["password"]);
    state = const AsyncValue.data(null); */
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
