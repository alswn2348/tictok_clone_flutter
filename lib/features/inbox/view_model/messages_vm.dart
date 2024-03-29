import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone_flutter/features/authentication/repository/authhentication_repo.dart';
import 'package:tictok_clone_flutter/features/inbox/model/message.dart';
import 'package:tictok_clone_flutter/features/inbox/repository/messages_repository.dart';

class MessagesViewModel extends AsyncNotifier<void> {
  late final MessagesRepository _repo;

  @override
  FutureOr<void> build() {
    _repo = ref.read(messagesRepo);
  }

  Future<void> sendMessage(String text) async {
    final user = ref.read(authRepo).user;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final message = MessageModel(
        text: text,
        userId: user!.uid,
        createAt: DateTime.now().millisecondsSinceEpoch,
      );
      _repo.sendMessage(message);
    });
  }
}

final messagesProvider = AsyncNotifierProvider<MessagesViewModel, void>(
  () => MessagesViewModel(),
);

final chatProvider = StreamProvider.autoDispose(
  (ref) {
    final db = FirebaseFirestore.instance;

    return db
        .collection("chat_rooms")
        .doc("5wIEF4qSGhFMKms4Pjuu")
        .collection("texts")
        .orderBy("createdAt")
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (doc) => MessageModel.fromJson(
                  doc.data(),
                ),
              )
              .toList(),
        );
  },
);
