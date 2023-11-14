import 'package:flutter/material.dart';

import 'data/strings.dart';

class AppBottomNav extends StatefulWidget {
  AppBottomNav({super.key, required this.onIndexChanged});
  final Function onIndexChanged;


  @override
  State<AppBottomNav> createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black38,
        onTap: (index) => setState(() => {
          currentIndex = index,
          widget.onIndexChanged(index)
        }),
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label:  Strings.home,
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: Strings.cart,
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: Strings.profile,
              backgroundColor: Colors.white),
        ]);
  }
}
