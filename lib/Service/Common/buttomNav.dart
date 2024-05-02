import 'package:flutter/material.dart';

class buttomNav extends StatefulWidget {
  const buttomNav({super.key});

  @override
  State<buttomNav> createState() => _buttomNavState();
}

class _buttomNavState extends State<buttomNav> {
  int _navigationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _navigationIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 0,
      selectedItemColor: const Color.fromARGB(255, 0, 27, 48),
      onTap: (int navInIndex) {
        setState(() {
          _navigationIndex = navInIndex;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shop),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
