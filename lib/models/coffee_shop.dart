import "package:coffee_shop_app/const.dart";
import "package:flutter/material.dart";

import "coffee.dart";

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(
      name: 'Cafe Negro',
      price: '2.500',
      priceList: [2500, 2700, 3000],
      imagePath: "lib/images/cafe1.png",
      size: CoffeeSize.small,
    ),
    Coffee(
      name: 'Latte',
      price: '3.100',
      priceList: [3100, 3200, 3500],
      imagePath: "lib/images/cafe2.png",
      size: CoffeeSize.small,
    ),
    Coffee(
      name: 'Expresso',
      price: '2.600',
      priceList: [2600, 2700, 3000],
      imagePath: "lib/images/cafe3.png",
      size: CoffeeSize.small,
    ),
    Coffee(
      name: 'Cafe Helado',
      price: '3000',
      priceList: [3000, 3200, 3500],
      imagePath: "lib/images/cafe4.png",
      size: CoffeeSize.small,
    ),
  ];

  final List<Coffee> _userCart = [];

  List<Coffee> get coffeShop => _shop;
  List<Coffee> get userCart => _userCart;

  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void remoteItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }

  void editItemsFromCard() {}
}
