import 'package:flutter/material.dart';

class SizeQuantityTotal extends StatelessWidget {
  final List<int> sizeList;
  const SizeQuantityTotal({
    super.key,
    required this.sizeList,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: sizeList.asMap().entries.map((entry) {
        int index = entry.key;
        int size = entry.value;

        return Column(
          children: [
            Icon(
              Icons.coffee_rounded,
              size: 20 + (index * 10),
            ),
            Text("X $size"),
          ],
        );
      }).toList(),
    );
  }
}
