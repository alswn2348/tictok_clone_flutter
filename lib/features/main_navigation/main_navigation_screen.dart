import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone_flutter/constants/gaps.dart';
import 'package:tictok_clone_flutter/constants/sizes.dart';
import 'package:tictok_clone_flutter/features/discover/discover_screen.dart';
import 'package:tictok_clone_flutter/features/main_navigation/stf_screen.dart';
import 'package:tictok_clone_flutter/features/main_navigation/widgets/navigation_tab.dart';
import 'package:tictok_clone_flutter/features/main_navigation/widgets/post_video_button.dart';
import 'package:tictok_clone_flutter/features/videos/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 1;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Container(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Offstage(
              offstage: _selectedIndex != 0,
              child: const VideoTimelineScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 1,
              child: const DiscoverScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 3,
              child: const StfScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 4,
              child: const StfScreen(),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: _selectedIndex == 0 ? Colors.black : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size12),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavigationTap(
                    selectedIndex: _selectedIndex,
                    text: "Home",
                    isSelected: _selectedIndex == 0,
                    icon: FontAwesomeIcons.house,
                    selectedIcon: FontAwesomeIcons.house,
                    onTap: () => _onTap(0),
                  ),
                  NavigationTap(
                    selectedIndex: _selectedIndex,
                    text: "Discover",
                    isSelected: _selectedIndex == 1,
                    icon: FontAwesomeIcons.compass,
                    selectedIcon: FontAwesomeIcons.solidCompass,
                    onTap: () => _onTap(1),
                  ),
                  Gaps.h24,
                  GestureDetector(
                    onTap: _onPostVideoButtonTap,
                    child: PostVideoButton(
                      inverted: _selectedIndex != 0,
                    ),
                  ),
                  Gaps.h24,
                  NavigationTap(
                    selectedIndex: _selectedIndex,
                    text: "Inbox",
                    isSelected: _selectedIndex == 3,
                    icon: FontAwesomeIcons.message,
                    selectedIcon: FontAwesomeIcons.solidMessage,
                    onTap: () => _onTap(3),
                  ),
                  NavigationTap(
                    selectedIndex: _selectedIndex,
                    text: "Profile",
                    isSelected: _selectedIndex == 4,
                    icon: FontAwesomeIcons.user,
                    selectedIcon: FontAwesomeIcons.solidUser,
                    onTap: () => _onTap(4),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
