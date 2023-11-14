import 'package:flutter/material.dart';
import 'package:introduction_to_flutter_and_dart/data/models/grocery_item.dart';
import 'package:introduction_to_flutter_and_dart/util/mock.dart';

import 'data/styles.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});


  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<GroceryItem> groceryItems=MockData().groceryItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceryItems.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(groceryItems[index].image, width: 60, height: 60,),
                Text(
                  groceryItems[index].name,
                  style: TextStyles.body,
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "PKR ${groceryItems[index].price} / ${groceryItems[index].unit}",
                      style: TextStyles.highlight,
                    ),
                    Text(
                      "Quantity ${groceryItems[index].quantity}",
                      style: TextStyles.body,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.delete,color: Colors.red,),
                )

              ],
            ),
          ),
        );
      },
    );
  }
}
