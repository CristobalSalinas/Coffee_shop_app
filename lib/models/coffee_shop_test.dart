import 'package:coffee_shop_app/const.dart';
import 'package:coffee_shop_app/models/coffee_shop_item.dart';
import 'package:coffee_shop_app/models/coffee_test.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

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
  int _totalPrice = 0;

  List<CoffeeTest> get coffeeShop => _shop;
  List<CoffeShopItem> get userCart => _userCart;
  int get coffeesTotalPrice => _totalPrice;

  void addCoffeesToCard(CoffeeTest coffee, CoffeeSize size, int total) {
    CoffeShopItem? coffeFound = _userCart.firstWhereOrNull(
      (element) => element.coffee.name == coffee.name,
    );

    if (coffeFound == null) {
      CoffeShopItem newCoffee = CoffeShopItem(
        coffee: coffee,
        smallTotal: size == CoffeeSize.small ? total : 0,
        mediumTotal: size == CoffeeSize.medium ? total : 0,
        largeTotal: size == CoffeeSize.large ? total : 0,
      );

      _userCart.add(newCoffee);
    } else {
      _userCart.forEach((element) {
        if (element.coffee.name == coffee.name) {
          switch (size) {
            case CoffeeSize.small:
              element.smallTotal = element.smallTotal + total;
              break;
            case CoffeeSize.medium:
              element.mediumTotal = element.mediumTotal + total;
              break;
            default:
              element.largeTotal = element.largeTotal + total;
          }
        }
      });
    }

    getCoffeesTotal();
    notifyListeners();
  }

  void editCoffeesQuantities(String coffeeName, List<int> quantities) {
    // En caso de que la lista de cantidades de cafes sean todas 0
    // Voy a eliminar el elemento de el cafe de el carrito para que no aparescan
    // las cantidades de cafes en 0

    if (quantities[0] == 0 && quantities[1] == 0 && quantities[2] == 0) {
      _userCart.removeWhere((element) => element.coffee.name == coffeeName);
    } else {
      for (var i = 0; i < userCart.length; i++) {
        if (userCart[i].coffee.name == coffeeName) {
          userCart[i].smallTotal = quantities[0];
          userCart[i].mediumTotal = quantities[1];
          userCart[i].largeTotal = quantities[2];
        }
      }
    }

    getCoffeesTotal();
    notifyListeners();
  }

  void getCoffeesTotal() {
    int total = 0;

    for (var i = 0; i < userCart.length; i++) {
      int smallTotal = userCart[i].smallTotal;
      int mediumTotal = userCart[i].mediumTotal;
      int largeTotal = userCart[i].largeTotal;

      print("smallTotal $smallTotal");
      print("mediumTotal $mediumTotal");
      print("largeTotal $largeTotal");

      String coffeeName = userCart[i].coffee.name;

      CoffeeTest? coffeFound =
          _shop.firstWhereOrNull((element) => element.name == coffeeName);

      total = total +
          ((coffeFound!.bigPrice * largeTotal) +
              (coffeFound.mediumPrice * mediumTotal) +
              (coffeFound.smallPrice * smallTotal));
    }

    _totalPrice = total;
  }
}
