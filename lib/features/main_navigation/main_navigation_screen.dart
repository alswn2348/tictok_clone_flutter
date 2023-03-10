import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screens = [
    const Center(
      child: Text('home'),
    ),
    const Center(
      child: Text('Search'),
    ),
    const Center(
      child: Text('Search'),
    ),
    const Center(
      child: Text('Search'),
    ),
    const Center(
      child: Text('Search'),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        selectedItemColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: 'Home',
            tooltip: 'what?',
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
              label: 'search',
              tooltip: 'what?',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
              label: 'search',
              tooltip: 'what?',
              backgroundColor: Colors.yellow),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
              label: 'search',
              tooltip: 'what?',
              backgroundColor: Colors.cyan),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
              label: 'search',
              tooltip: 'what?',
              backgroundColor: Colors.green),
        ],
      ),
    );
  }
}
