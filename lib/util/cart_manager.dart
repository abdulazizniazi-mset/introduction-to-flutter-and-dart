import 'package:flutter/cupertino.dart';
import 'package:introduction_to_flutter_and_dart/data/models/grocery_item.dart';

class CartManager extends ChangeNotifier{
  static final _groceryList = <GroceryItem>[];
  List<GroceryItem> get groceryList => _groceryList;
  int  get count => groceryList.length;
  void addToCart(GroceryItem item){
    print("Adding to cart");
    if (_existsInCart(item)){
      _groceryList[_groceryList.indexOf(item)].quantity+=1;
    } else {
      _groceryList.add(item);
    }
    notifyListeners();
  }

  bool _existsInCart(GroceryItem item){
    return _groceryList.contains(item);
  }

  int itemCount(GroceryItem item){
    if (!_existsInCart(item)) {
      return -1;
    }
    return _groceryList[_groceryList.indexOf(item)].quantity;
  }

  void clear(GroceryItem item){
    _groceryList.remove(item);
    notifyListeners();
  }

  void removeFromCart(GroceryItem item){
    if (_existsInCart(item) && _groceryList[_groceryList.indexOf(item)].quantity > 1){
      _groceryList[_groceryList.indexOf(item)].quantity-=1;
    } else {
      _groceryList.remove(item);
    }
    notifyListeners();
  }
}