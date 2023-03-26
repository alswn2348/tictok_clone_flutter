import 'package:go_router/go_router.dart';
import 'package:tictok_clone_flutter/features/videos/video_recording_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const VideoRecordingScreen(),
  )
]);
