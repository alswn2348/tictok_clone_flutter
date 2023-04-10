import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone_flutter/features/user/models/user_profiel_model.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createProfile(UserProfileModel profile) async {
    await _db.collection("users").doc(profile.uid).set(
          profile.toJson(),
        );
  }
}

final userRepo = Provider(
  (ref) => UserRepository(),
);
