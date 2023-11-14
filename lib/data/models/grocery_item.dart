class GroceryItem {
  String name;
  String type;
  int price;
  String unit;
  String image;
  int quantity = 1;

  GroceryItem({
    required this.name,
    required this.type,
    required this.price,
    required this.image,
    required this.unit
  });
}
