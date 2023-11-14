import 'package:flutter/material.dart';

import '../util/mock.dart';
import 'list_item.dart';

class HomeList extends StatefulWidget {
  const HomeList({super.key});

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  var mockData = MockData().groceryItems;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        mockData.length,
            (index) => GroceryListItem(
          groceryItem: mockData[index],
        ),
      ),
    );
  }
}
