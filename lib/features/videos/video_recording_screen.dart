import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tictok_clone_flutter/constants/gaps.dart';
import 'package:tictok_clone_flutter/constants/sizes.dart';

import 'widgets/flash_mode_button.dart';

class VideoRecordingScreen extends StatefulWidget {
  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen>
    with TickerProviderStateMixin {
  late final AnimationController _buttonAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
  );

  late final AnimationController _progressAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
    lowerBound: 0.0,
    upperBound: 1.0,
  );

  late final Animation<double> _buttonAnimaion =
      Tween(begin: 1.0, end: 1.3).animate(_buttonAnimationController);

  bool _hasPermission = false;

  bool _isSelfieMode = false;

  late CameraController _cameraController;

  FlashMode flashMode = FlashMode.auto;

  @override
  void initState() {
    super.initState();
    initPermissions();
    _progressAnimationController.addListener(() {
      setState(() {});
    });
    _progressAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _stopRecording();
      }
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;

    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      return;
    }

    _cameraController = CameraController(
      cameras[_isSelfieMode ? 1 : 0],
      ResolutionPreset.ultraHigh,
    );

    await _cameraController.initialize();

    flashMode = _cameraController.value.flashMode;
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    flashMode = newFlashMode;
    setState(() {});
  }

  void _startRecording(TapDownDetails _) {
    _buttonAnimationController.forward();
    _progressAnimationController.forward();
  }

  void _stopRecording() {
    _buttonAnimationController.reverse();
    _progressAnimationController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: !_hasPermission || !_cameraController.value.isInitialized
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Initializing...",
                    style:
                        TextStyle(color: Colors.white, fontSize: Sizes.size20),
                  ),
                  Gaps.v20,
                  CircularProgressIndicator.adaptive()
                ],
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  CameraPreview(_cameraController),
                  Positioned(
                    top: Sizes.size10,
                    right: Sizes.size20,
                    child: Column(
                      children: [
                        IconButton(
                          color: Colors.white,
                          icon: const Icon(Icons.cameraswitch),
                          onPressed: _toggleSelfieMode,
                        ),
                        Gaps.v10,
                        FlashModeButton(
                          checkFlashMode: flashMode == FlashMode.off,
                          onPressed: () => _setFlashMode(FlashMode.off),
                          icon: Icons.flash_off_rounded,
                        ),
                        Gaps.v10,
                        FlashModeButton(
                          checkFlashMode: flashMode == FlashMode.always,
                          onPressed: () => _setFlashMode(FlashMode.always),
                          icon: Icons.flash_on_rounded,
                        ),
                        Gaps.v10,
                        FlashModeButton(
                          checkFlashMode: flashMode == FlashMode.auto,
                          onPressed: () => _setFlashMode(FlashMode.auto),
                          icon: Icons.flash_auto_rounded,
                        ),
                        Gaps.v10,
                        FlashModeButton(
                          checkFlashMode: flashMode == FlashMode.torch,
                          icon: Icons.flash_on_rounded,
                          onPressed: () => _setFlashMode(FlashMode.torch),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: Sizes.size40,
                      child: ScaleTransition(
                        scale: _buttonAnimaion,
                        child: GestureDetector(
                          onTapDown: _startRecording,
                          onTapUp: (details) => _stopRecording,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: Sizes.size60 + Sizes.size14,
                                height: Sizes.size60 + Sizes.size14,
                                child: CircularProgressIndicator(
                                  color: Colors.red.shade400,
                                  strokeWidth: Sizes.size6,
                                  value: _progressAnimationController.value,
                                ),
                              ),
                              Container(
                                width: Sizes.size60,
                                height: Sizes.size60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
      ),
    );
  }
}
