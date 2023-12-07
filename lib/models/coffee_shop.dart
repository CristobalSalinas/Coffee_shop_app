import "coffee.dart";

class CoffeeShop {
  final List<Coffee> _shop = [
    Coffee(
      name: 'Cafe Negro',
      price: '2.500',
      imagePath: "lib/images/cafe1.png",
    ),
    Coffee(
      name: 'Latte',
      price: '3.100',
      imagePath: "lib/images/cafe2.png",
    ),
    Coffee(
      name: 'Expresso',
      price: '2.600',
      imagePath: "lib/images/cafe3.png",
    ),
    Coffee(
      name: 'Cafe Helado',
      price: '3000',
      imagePath: "lib/images/cafe4.png",
    ),
  ];

  final List<Coffee> _userCart = [];

  List<Coffee> get coffeShop => _shop;
  List<Coffee> get userCart => _userCart;

  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
  }

  void remoteItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
  }
}
