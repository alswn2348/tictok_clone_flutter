import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone_flutter/features/authentication/repository/authhentication_repo.dart';
import 'package:tictok_clone_flutter/features/user/repository/user_repository.dart';
import 'package:tictok_clone_flutter/features/user/view_models/users_view_model.dart';
import 'package:tictok_clone_flutter/utils.dart';

class AvatarViewModel extends AsyncNotifier<void> {
  late final UserRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(userRepo);
  }

  Future<void> uploadavatar(BuildContext context, File file) async {
    state = const AsyncValue.loading();
    final fileName = ref.read(authRepo).user!.uid;
    state = await AsyncValue.guard(
      () async {
        await _repository.uploadAvatar(file, fileName);
        await ref.read(usersProvider.notifier).onAvatarUpload();
      },
    );
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    }
  }
}

final avatarProvider = AsyncNotifierProvider<AvatarViewModel, void>(
  () => AvatarViewModel(),
);
