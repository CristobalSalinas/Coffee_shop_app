import 'package:coffee_shop_app/utils/price_formatter.dart';
import 'package:flutter/material.dart';

class PriceList extends StatelessWidget {
  final List<int> priceList;
  const PriceList({super.key, required this.priceList});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: priceList.asMap().entries.map((entry) {
        int index = entry.key;
        int price = entry.value;

        return Column(
          children: [
            Icon(
              Icons.coffee_rounded,
              size: 20 + (index * 10),
            ),
            Text(priceFormatter(price.toString())),
          ],
        );
      }).toList(),
    );
  }
}
