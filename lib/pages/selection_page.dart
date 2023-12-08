import 'package:coffee_shop_app/components/coffee_tile.dart';
import 'package:coffee_shop_app/models/coffee.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Agregado correctamente"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Text(
                "Como te gusta tu cafe?",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    Coffee eachCoffee = value.coffeShop[index];
                    return CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () => addToCart(eachCoffee),
                      icon: const Icon(Icons.add),
                    );
                  },
                  itemCount: value.coffeShop.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
