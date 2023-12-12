import 'package:coffee_shop_app/const.dart';
import 'package:coffee_shop_app/utils/price_formatter.dart';

class Coffee {
  final String name;
  final String price;
  final List<int> priceList;
  final String imagePath;
  final CoffeeSize size;

  Coffee({
    required this.name,
    required this.price,
    required this.priceList,
    required this.imagePath,
    required this.size,
  });

  String getCartCoffeeSize() {
    const Map<CoffeeSize, int> priceIndex = {
      CoffeeSize.small: 0,
      CoffeeSize.medium: 1,
      CoffeeSize.large: 2,
    };

    return priceFormatter(priceList[priceIndex[size]!].toString());
  }
}
