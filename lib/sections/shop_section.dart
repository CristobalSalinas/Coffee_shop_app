import 'package:coffee_shop_app/components/coffee_tile_test.dart';
import 'package:coffee_shop_app/components/price_list.dart';
import 'package:coffee_shop_app/models/coffee.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:coffee_shop_app/pages/add_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopSection extends StatefulWidget {
  const ShopSection({super.key});

  @override
  State<ShopSection> createState() => _ShopSectionState();
}

class _ShopSectionState extends State<ShopSection> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Agregado correctamente"),
      ),
    );
  }

  void goToCoffeeSelectionDetails(BuildContext context, Coffee coffee) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddPage(coffee),
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

                    return CoffeeTileTest(
                      image: eachCoffee.imagePath,
                      title: eachCoffee.name,
                      description: PriceList(priceList: eachCoffee.priceList),
                      onPressed: () =>
                          goToCoffeeSelectionDetails(context, eachCoffee),
                      icon: const Icon(Icons.add),
                    );

                    // return CoffeeTile(
                    //   coffee: eachCoffee,
                    //   onPressed: () => goToCoffeeSelectionDetails(
                    //     context,
                    //     eachCoffee,
                    //   ), //addToCart(eachCoffee),
                    //   icon: const Icon(Icons.add),
                    // );
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
