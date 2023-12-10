import 'package:coffee_shop_app/const.dart';
import 'package:flutter/material.dart';

class SizeOption extends StatelessWidget {
  final CoffeeSize labelValue;
  final CoffeeSize value;
  final void Function(CoffeeSize size) changeCoffeeSize;
  const SizeOption({
    super.key,
    required this.labelValue,
    required this.value,
    required this.changeCoffeeSize,
  });

  @override
  Widget build(BuildContext context) {
    const categories = {
      CoffeeSize.small: "P",
      CoffeeSize.medium: "M",
      CoffeeSize.large: "G",
    };

    bool isSameValue = value == labelValue;

    return GestureDetector(
      onTap: () {
        changeCoffeeSize(labelValue);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSameValue ? Colors.brown : Colors.grey[50],
          borderRadius: BorderRadius.circular(26),
        ),
        height: 60,
        width: 60,
        child: Center(
          child: Text(
            categories[labelValue].toString(),
            style: TextStyle(
                fontSize: 22, color: isSameValue ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
