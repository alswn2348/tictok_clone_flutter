import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone_flutter/features/authentication/repository/authhentication_repo.dart';
import 'package:tictok_clone_flutter/features/user/view_models/users_view_model.dart';
import 'package:tictok_clone_flutter/features/videos/models/video_model.dart';
import 'package:tictok_clone_flutter/features/videos/repository/videos_repo.dart';

class UploadVideoViewModel extends AsyncNotifier<void> {
  late final VideosRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(videoRepo);
  }

  Future<void> uploadVideo(File video, BuildContext context) async {
    final user = ref.read(authRepo).user;
    final userProfile = ref.read(usersProvider).value;
    if (userProfile != null) {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(
        () async {
          final task = await _repository.uploadVideoFile(
            video,
            user!.uid,
          );
          if (task.metadata != null) {
            await _repository.saveVideo(
              VideoModel(
                title: "great Title!",
                description: "hello world!",
                fileUrl: await task.ref.getDownloadURL(),
                thumbnailUrl: "",
                creatorUid: user.uid,
                likes: 0,
                comments: 0,
                createdAt: DateTime.now().millisecondsSinceEpoch,
                creator: userProfile.name,
              ),
            );
            context.pop();
            context.pop();
          }
        },
      );
    }
  }
}

final uploadVideopProvider = AsyncNotifierProvider<UploadVideoViewModel, void>(
  () => UploadVideoViewModel(),
);
