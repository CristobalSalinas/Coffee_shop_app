import 'package:coffee_shop_app/components/custom_button.dart';
import 'package:coffee_shop_app/components/quantity_selector.dart';
import 'package:coffee_shop_app/components/size_selector.dart';
import 'package:coffee_shop_app/const.dart';
import 'package:coffee_shop_app/models/coffee.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:coffee_shop_app/models/coffee_shop_test.dart';
import 'package:coffee_shop_app/models/coffee_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  final CoffeeTest coffee;
  const AddPage(this.coffee, {super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int quantity = 1;
  CoffeeSize size = CoffeeSize.small;

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

  void changeCoffeeSize(CoffeeSize sizeSelected) {
    setState(() {
      size = sizeSelected;
    });
  }

  void addToCard(BuildContext context) {
    Provider.of<CoffeeShopTest>(context, listen: false).addCoffeesToCard(
      widget.coffee,
      size,
      quantity,
    );

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        backgroundColor: Colors.brown,
        title: Text(
          "Cafe agregado correctamente",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ).then((value) => Navigator.pushNamed(context, '/shop'));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShopTest>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
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
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "T A M A Ñ O",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizeSelector(
                  size: size,
                  changeCoffeeSize: changeCoffeeSize,
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CustomButtom("Agregar al carrito", onTap: () {
                    addToCard(context);
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
