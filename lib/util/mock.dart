import 'package:introduction_to_flutter_and_dart/data/models/grocery_item.dart';

class MockData {
  var groceryItems = [
    GroceryItem(
        name: "Apple",
        type: "Fruits",
        price: 20,
        image: "assets/images"
            "/apple.jpg",
        unit: "KG"),
    GroceryItem(
        name: "Cucumber",
        type: "Vegetables",
        price: 30,
        image: "assets/images"
            "/cucumber.jpg",
        unit: "KG"),
    GroceryItem(
        name: "Carrots",
        type: "Vegetables",
        price: 40,
        image: "assets/images"
            "/carrot.jpg",
        unit: "KG"),
    GroceryItem(
        name: "Apricot",
        type: "Fruits",
        price: 20,
        image: "assets/images"
            "/apricot.jpg",
        unit: "KG"),
    GroceryItem(
        name: "Orange",
        type: "Fruits",
        price: 10,
        image: "assets/images"
            "/orange.jpg",
        unit: "KG"),
  ];
}
