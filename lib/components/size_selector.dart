import 'package:coffee_shop_app/components/size_option.dart';
import 'package:coffee_shop_app/const.dart';
import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  final CoffeeSize size;
  final void Function(CoffeeSize size) changeCoffeeSize;
  const SizeSelector({
    super.key,
    required this.size,
    required this.changeCoffeeSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizeOption(
          labelValue: CoffeeSize.small,
          value: size,
          changeCoffeeSize: changeCoffeeSize,
        ),
        const SizedBox(
          width: 10,
        ),
        SizeOption(
          labelValue: CoffeeSize.medium,
          value: size,
          changeCoffeeSize: changeCoffeeSize,
        ),
        const SizedBox(
          width: 10,
        ),
        SizeOption(
          labelValue: CoffeeSize.large,
          value: size,
          changeCoffeeSize: changeCoffeeSize,
        ),
      ],
    );
  }
}
