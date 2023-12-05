
import 'package:flutter/material.dart';
import 'package:introduction_to_flutter_and_dart/cart_manager.dart';
import 'package:provider/provider.dart';

import '../bottom_nav.dart';
import '../cart.dart';
import '../component/home_list.dart';
import '../data/models/grocery_item.dart';
import '../data/strings.dart';
import '../data/styles.dart';
import '../util/mock.dart';

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
    return ChangeNotifierProvider(
      create:  (_) => CartManager(),
      child: MaterialApp(
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
      ),
    );
  }
}