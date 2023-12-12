import 'package:flutter/material.dart';

class CoffeeTileTest extends StatelessWidget {
  final String image;
  final Widget icon;
  final String title;
  final Widget description;
  final void Function()? onPressed;
  const CoffeeTileTest({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.onPressed,
    required this.icon,
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
        leading: Image.asset(image),
        title: Text(title),
        subtitle: description,
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
