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

  @override
  bool operator ==(Object other) =>
      other is GroceryItem &&
          other.runtimeType == runtimeType &&
          other.name == name;


  @override
  int get hashCode => name.hashCode;
}
