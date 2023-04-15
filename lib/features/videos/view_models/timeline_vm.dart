import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone_flutter/features/videos/models/video_model.dart';
import 'package:tictok_clone_flutter/features/videos/repository/videos_repo.dart';

class TimelineViewModel extends AsyncNotifier<List<VideoModel>> {
  List<VideoModel> _list = [];
  late final VideosRepository _repository;

  @override
  FutureOr<List<VideoModel>> build() async {
    _repository = ref.read(videosRepo);
    final result = await _repository.fetchVideos();
    final newList = result.docs.map(
      (doc) => VideoModel.fromJson(
        doc.data(),
      ),
    );
    _list = newList.toList();
    return _list;
  }
}

final timelineProvider =
    AsyncNotifierProvider<TimelineViewModel, List<VideoModel>>(
  () => TimelineViewModel(),
);
