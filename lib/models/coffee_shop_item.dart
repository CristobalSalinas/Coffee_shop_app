import 'package:coffee_shop_app/models/coffee_test.dart';

class CoffeShopItem {
  final CoffeeTest coffee;
  int smallTotal = 0;
  int mediumTotal = 0;
  int largeTotal = 0;

  CoffeShopItem({
    required this.coffee,
    required this.smallTotal,
    required this.mediumTotal,
    required this.largeTotal,
  });
}
