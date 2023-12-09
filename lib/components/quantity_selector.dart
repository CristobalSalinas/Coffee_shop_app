import 'package:coffee_shop_app/components/quantity_button.dart';
import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final int total;
  final void Function()? addQuantity;
  final void Function()? substractQuantity;
  const QuantitySelector(this.total,
      {super.key, required this.addQuantity, this.substractQuantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: substractQuantity,
          child: const QuantityButton(
            icon: Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(15),
          ),
          height: 60,
          width: 60,
          child: Center(
            child: Text(
              total.toString(),
              style: TextStyle(fontSize: 28),
            ),
          ),
        ),
        GestureDetector(
          onTap: addQuantity,
          child: const QuantityButton(
            icon: Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }
}
