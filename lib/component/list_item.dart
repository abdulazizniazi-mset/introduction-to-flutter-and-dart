import 'package:flutter/material.dart';
import 'package:introduction_to_flutter_and_dart/util/cart_manager.dart';
import 'package:introduction_to_flutter_and_dart/data/models/grocery_item.dart';
import 'package:introduction_to_flutter_and_dart/data/styles.dart';
import 'package:provider/provider.dart';

class GroceryListItem extends StatelessWidget {
  const GroceryListItem({super.key, required this.groceryItem});

  final GroceryItem groceryItem;
  final double imageSize = 60;
  final double defaultMargin = 8;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartManager>(context);

    return ListenableBuilder(
      listenable: cartProvider,
      builder: (context, child){
        return Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(defaultMargin),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                    width: imageSize,
                    height: imageSize,
                    child: Image.asset(groceryItem.image)),
                SizedBox(width: defaultMargin),
                Text(
                  groceryItem.name,
                  style: TextStyles.body,
                ),
                Text(
                  groceryItem.type,
                  style: TextStyles.footnote,
                ),
                Text(
                  "PKR ${groceryItem.price} / ${groceryItem.unit}",
                  style: TextStyles.highlight,
                ),
                Visibility(
                  visible: cartProvider.itemCount(groceryItem) > 0,
                  child: Text(
                    "In Cart: ${cartProvider.itemCount(groceryItem)}",
                    style: TextStyles.highlight.copyWith(color: Colors.blue),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () => {cartProvider.addToCart(groceryItem)},
                        style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        child: const Icon(
                          Icons.add,
                          size: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: defaultMargin,
                    ),
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () => {cartProvider.removeFromCart(groceryItem)},
                        style:
                        ElevatedButton.styleFrom(foregroundColor: Colors.red),
                        child: const Icon(
                          Icons.remove,
                          size: 14,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
