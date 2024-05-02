import 'package:flutter/material.dart';
import 'package:shopink/LandingPage.dart';
import 'package:shopink/cart.dart';
import 'package:shopink/favoritePage.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int buttomNavIndex = 0;
  final List _pages = [
    const LandingPage(),
    const FavoritrPage(),
    const cart(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[buttomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: buttomNavIndex,
        onTap: (int index) {
          setState(() {
            buttomNavIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
