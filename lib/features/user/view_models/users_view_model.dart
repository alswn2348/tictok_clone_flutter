import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone_flutter/features/user/models/user_profiel_model.dart';
import 'package:tictok_clone_flutter/features/user/repository/user_repository.dart';

class UserViewModel extends AsyncNotifier<UserProfileModel> {
  late final UserRepository _repository;

  @override
  FutureOr<UserProfileModel> build() {
    _repository = ref.read(userRepo);
    return UserProfileModel.empty();
  }

  Future<void> createUserProfile(UserCredential credential) async {
    if (credential.user == null) {
      throw Exception("Account not created");
    }
    state = const AsyncValue.loading();
    final profile = UserProfileModel(
      bio: "undefined",
      link: "undefined",
      uid: credential.user!.uid,
      name: credential.user!.displayName ?? "Anon",
      email: credential.user!.email ?? "anon@anon.com",
    );
    _repository.createProfile(profile);
    state = AsyncValue.data(profile);
  }
}

final usersProvider = AsyncNotifierProvider<UserViewModel, UserProfileModel>(
  () => UserViewModel(),
);
