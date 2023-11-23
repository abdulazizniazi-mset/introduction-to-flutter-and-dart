import 'package:flutter/material.dart';
import 'package:introduction_to_flutter_and_dart/cart_manager.dart';
import 'package:provider/provider.dart';

import 'data/styles.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartManager>(context);

    return cartProvider.count == 0
        ? const Center(child: Text("No items in cart", style: TextStyles.title,))
        : ListView.builder(
            itemCount: cartProvider.groceryList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        cartProvider.groceryList[index].image,
                        width: 60,
                        height: 60,
                      ),
                      Text(
                        cartProvider.groceryList[index].name,
                        style: TextStyles.body,
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "PKR ${cartProvider.groceryList[index].price} / ${cartProvider.groceryList[index].unit}",
                            style: TextStyles.highlight,
                          ),
                          Text(
                            "Quantity ${cartProvider.groceryList[index].quantity}",
                            style: TextStyles.body,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => {
                            cartProvider.clear(cartProvider.groceryList[index])
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
  }
}
