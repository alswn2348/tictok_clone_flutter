import 'package:flutter/material.dart';
import 'package:tictok_clone_flutter/features/videos/views/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
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
    return RefreshIndicator(
      onRefresh: _onRefresh,
      displacement: 50,
      edgeOffset: 2,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        scrollDirection: Axis.vertical,
        itemCount: _itemCount,
        itemBuilder: (context, index) =>
            VideoPost(onVideoFinshed: _onViedoFinished, index: index),
      ),
    );
  }
}
