import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone_flutter/features/videos/view_models/timeline_vm.dart';
import 'package:tictok_clone_flutter/features/videos/views/widgets/video_post.dart';

class VideoTimelineScreen extends ConsumerStatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  VideoTimelineScreenState createState() => VideoTimelineScreenState();
}

class VideoTimelineScreenState extends ConsumerState<VideoTimelineScreen> {
  final PageController _pageController = PageController();

  final _scrollDuration = const Duration(milliseconds: 200);
  final _scrollCurve = Curves.linear;

  int _itemCount = 3;

  void _onPageChanged(int page) {
    if (page == _itemCount - 1) {
      _pageController.animateToPage(page,
          duration: _scrollDuration, curve: _scrollCurve);
      _itemCount = _itemCount + 3;

      setState(() {});
    }
  }

  void _onViedoFinished() {
    return;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    return Future.delayed(const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(timelineProvider).when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Center(
            child: Text('could not load videos : $error'),
          ),
          data: (videos) => RefreshIndicator(
            onRefresh: _onRefresh,
            displacement: 50,
            edgeOffset: 2,
            child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                scrollDirection: Axis.vertical,
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  final videoData = videos[index];
                  return VideoPost(
                    onVideoFinshed: _onViedoFinished,
                    index: index,
                    videoData: videoData,
                  );
                }),
          ),
        );
  }
}
