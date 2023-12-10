import 'package:coffee_shop_app/const.dart';

class Coffee {
  final String name;
  final String price;
  final String imagePath;
  final CoffeeSize size;

  Coffee({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.size,
  });
}
