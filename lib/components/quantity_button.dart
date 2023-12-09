import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  final Widget icon;
  const QuantityButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: Center(
        child: icon,
      ),
    );
  }
}
