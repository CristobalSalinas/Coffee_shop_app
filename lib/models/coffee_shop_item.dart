import 'package:coffee_shop_app/models/coffee_test.dart';

class CoffeShopItem {
  final CoffeeTest coffee;
  final int smallTotal;
  final int mediumTotal;
  final int largeTotal;

  CoffeShopItem({
    required this.coffee,
    required this.smallTotal,
    required this.mediumTotal,
    required this.largeTotal,
  });
}
