import 'package:coffee_shop_app/const.dart';
import 'package:coffee_shop_app/models/coffee_shop_item.dart';
import 'package:coffee_shop_app/models/coffee_test.dart';
import 'package:flutter/material.dart';

class CoffeeShopTest extends ChangeNotifier {
  final List<CoffeeTest> _shop = [
    CoffeeTest(
      name: "Cafe negro",
      imagePath: "lib/images/cafe1.png",
      smallPrice: 2500,
      mediumPrice: 2700,
      bigPrice: 3000,
    ),
    CoffeeTest(
      name: "Latte",
      imagePath: "lib/images/cafe2.png",
      smallPrice: 3100,
      mediumPrice: 3200,
      bigPrice: 3500,
    ),
    CoffeeTest(
      name: "Expresso",
      imagePath: "lib/images/cafe3.png",
      smallPrice: 2600,
      mediumPrice: 2700,
      bigPrice: 3000,
    ),
    CoffeeTest(
      name: "Cafe Helado",
      imagePath: "lib/images/cafe4.png",
      smallPrice: 3000,
      mediumPrice: 3200,
      bigPrice: 3500,
    ),
  ];
  final List<CoffeShopItem> _userCart = [];

  List<CoffeeTest> get coffeeShop => _shop;
  List<CoffeShopItem> get userCard => _userCart;

  void addCoffeesToCard(CoffeeTest coffee, CoffeeSize size, int total) {
    print("Mi cafe es ${coffee.name}");
    print("La cantidad es $size");
    print("El total es $total");
    //notifyListeners();

    //_userCart.firstWhere((element) => element.coffee.name == coffee.name)
  }
}
