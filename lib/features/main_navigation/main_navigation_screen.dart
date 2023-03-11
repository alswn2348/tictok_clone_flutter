import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone_flutter/constants/sizes.dart';
import 'package:tictok_clone_flutter/features/main_navigation/stf_screen.dart';
import 'package:tictok_clone_flutter/features/main_navigation/widgets/navigation_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Offstage(
              offstage: _selectedIndex != 0,
              child: const StfScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 1,
              child: const StfScreen(),
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
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size12),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavigationTap(
                    text: "Home",
                    isSelected: _selectedIndex == 0,
                    icon: FontAwesomeIcons.house,
                    selectedIcon: FontAwesomeIcons.house,
                    onTap: () => _onTap(0),
                  ),
                  NavigationTap(
                    text: "Discover",
                    isSelected: _selectedIndex == 1,
                    icon: FontAwesomeIcons.compass,
                    selectedIcon: FontAwesomeIcons.solidCompass,
                    onTap: () => _onTap(1),
                  ),
                  NavigationTap(
                    text: "Inbox",
                    isSelected: _selectedIndex == 3,
                    icon: FontAwesomeIcons.message,
                    selectedIcon: FontAwesomeIcons.solidMessage,
                    onTap: () => _onTap(3),
                  ),
                  NavigationTap(
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
