import 'package:coffee_shop_app/components/coffee_size_display.dart';
import 'package:coffee_shop_app/components/quantity_selector.dart';
import 'package:flutter/material.dart';

class EditCoffesTile extends StatelessWidget {
  final String title;
  final int quantity;
  final void Function()? addQuantity;
  final void Function()? substractQuantity;
  const EditCoffesTile({
    super.key,
    required this.title,
    required this.quantity,
    required this.addQuantity,
    required this.substractQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CoffeSizeDisplay(title: title),
        QuantitySelector(
          quantity,
          addQuantity: addQuantity,
          substractQuantity: substractQuantity,
        )
      ],
    );
  }
}
