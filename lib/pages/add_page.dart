import 'package:coffee_shop_app/components/quantity_selector.dart';
import 'package:coffee_shop_app/models/coffee.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  final Coffee coffee;
  const AddPage(this.coffee, {super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int quantity = 1;

  void goBackToCart(BuildContext context) {
    Navigator.pop(context);
  }

  void addQuantity() {
    setState(() {
      quantity++;
    });
  }

  void substractQuantity() {
    setState(() {
      if (quantity <= 1) {
        quantity = 1;
      } else {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: () => goBackToCart(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.coffee.imagePath,
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "C A N T I D A D",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[600],
                ),
              ),
              QuantitySelector(
                quantity,
                addQuantity: addQuantity,
                substractQuantity: substractQuantity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
