import 'package:flutter/material.dart';
import 'package:introduction_to_flutter_and_dart/cart_manager.dart';
import 'package:introduction_to_flutter_and_dart/component/home_list.dart';
import 'package:introduction_to_flutter_and_dart/data/strings.dart';
import 'package:introduction_to_flutter_and_dart/data/styles.dart';
import 'package:introduction_to_flutter_and_dart/util/mock.dart';
import 'package:provider/provider.dart';

import 'bottom_nav.dart';
import 'cart.dart';
import 'data/models/grocery_item.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartManager(),
      child: const HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  int totalItems = MockData().groceryItems.length;
  List<GroceryItem> cartItems = [];
  late CartScreen cartScreen;
  final pages = <StatefulWidget>[const HomeList(), const CartScreen()];

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
