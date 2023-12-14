import 'package:flutter/material.dart';

class CoffeSizeDisplay extends StatelessWidget {
  final String title;
  const CoffeSizeDisplay({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.circular(26),
      ),
      height: 60,
      width: 60,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
    );
  }
}
