import 'package:coffee_shop_app/components/price_list.dart';
import 'package:coffee_shop_app/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final bool showPriceList;
  final void Function()? onPressed;
  final Widget icon;
  const CoffeeTile({
    super.key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
    this.showPriceList = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(coffee.imagePath),
        title: Text(coffee.name),
        subtitle: showPriceList
            ? PriceList(
                priceList: coffee.priceList,
              )
            : Text(coffee.getCartCoffeeSize()), //Text(coffee.price),
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
