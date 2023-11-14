import 'package:flutter/material.dart';
import 'package:introduction_to_flutter_and_dart/component/home_list.dart';
import 'package:introduction_to_flutter_and_dart/data/strings.dart';
import 'package:introduction_to_flutter_and_dart/data/styles.dart';
import 'package:introduction_to_flutter_and_dart/util/mock.dart';

import 'bottom_nav.dart';
import 'cart.dart';
import 'data/models/grocery_item.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  int totalItems = MockData().groceryItems.length;
  List<GroceryItem> cartItems= [];
  final pages = [
    const HomeList(),
    CartScreen()
  ];

  void onIndexChanged(index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            Strings.appName,
            style: TextStyles.title,
          ),
          elevation: 0,
        ),
        bottomNavigationBar: AppBottomNav(onIndexChanged: onIndexChanged),
        body: pages[pageIndex],
      ),
    );
  }
}
