import 'package:flutter/material.dart';
import 'package:introduction_to_flutter_and_dart/util/cart_manager.dart';
import 'package:provider/provider.dart';

import '../data/strings.dart';

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
    final cartProvider = Provider.of<CartManager>(context);

    return ListenableBuilder(
      listenable: cartProvider,
      builder: (context, child){
        return BottomNavigationBar(
            currentIndex: currentIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black38,
            onTap: (index) => setState(
                    () => {currentIndex = index, widget.onIndexChanged(index)}),
            type: BottomNavigationBarType.shifting,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: Strings.home,
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Badge(
                    isLabelVisible: cartProvider.count > 0,
                    label: Text(cartProvider.count.toString()),
                    child: const Icon(Icons.shopping_cart),
                  ),
                  label: Strings.cart,
                  backgroundColor: Colors.white),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: Strings.profile,
                  backgroundColor: Colors.white),
            ]);
      },
    );
  }
}
