import 'package:coffee_shop_app/components/coffee_tile_test.dart';
import 'package:coffee_shop_app/components/price_list.dart';
import 'package:coffee_shop_app/models/coffee_shop_test.dart';
import 'package:coffee_shop_app/models/coffee_test.dart';
import 'package:coffee_shop_app/pages/add_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopSection extends StatefulWidget {
  const ShopSection({super.key});

  @override
  State<ShopSection> createState() => _ShopSectionState();
}

class _ShopSectionState extends State<ShopSection> {
  // void addToCart(Coffee coffee) {
  //   Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
  //   showDialog(
  //     context: context,
  //     builder: (context) => const AlertDialog(
  //       title: Text("Agregado correctamente"),
  //     ),
  //   );
  // }

  void goToCoffeeSelectionDetails(BuildContext context, CoffeeTest coffee) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddPage(coffee),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShopTest>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              const Text(
                "Como te gusta tu Cafe?",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    CoffeeTest eachCoffe = value.coffeeShop[index];
                    List<int> coffeePriceList = [
                      eachCoffe.smallPrice,
                      eachCoffe.mediumPrice,
                      eachCoffe.bigPrice,
                    ];

                    return CoffeeTileTest(
                      image: eachCoffe.imagePath,
                      title: eachCoffe.name,
                      description: PriceList(priceList: coffeePriceList),
                      onPressed: () => goToCoffeeSelectionDetails(
                        context,
                        eachCoffe,
                      ),
                      icon: const Icon(Icons.add),
                    );
                  },
                  itemCount: value.coffeeShop.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
