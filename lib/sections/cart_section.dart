import 'package:coffee_shop_app/components/coffee_tile_test.dart';
import 'package:coffee_shop_app/components/edit_coffes.dart';
import 'package:coffee_shop_app/components/size_quantity_total.dart';
import 'package:coffee_shop_app/models/coffee_shop_item.dart';
import 'package:coffee_shop_app/models/coffee_shop_test.dart';
import 'package:coffee_shop_app/models/coffee_test.dart';
import 'package:coffee_shop_app/utils/price_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartSection extends StatefulWidget {
  const CartSection({super.key});

  @override
  State<CartSection> createState() => _CartSectionState();
}

class _CartSectionState extends State<CartSection> {
  void closeEditDialog(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShopTest>(builder: (context, value, child) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                "Carrito",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.isEmpty ? 1 : value.userCart.length,
                  itemBuilder: (context, index) {
                    if (value.userCart.isEmpty) {
                      return Center(
                        child: Text(
                          "El carrito esta vacio, seleccione items desde la tienda",
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[600]),
                        ),
                      );
                    }

                    CoffeShopItem shopItem = value.userCart[index];
                    CoffeeTest eachCoffee = shopItem.coffee;
                    int smallTotal = shopItem.smallTotal;
                    int mediumTotal = shopItem.mediumTotal;
                    int largeTotal = shopItem.largeTotal;
                    List<int> coffeeTotals = [
                      smallTotal,
                      mediumTotal,
                      largeTotal
                    ];

                    return CoffeeTileTest(
                      image: eachCoffee.imagePath,
                      title: eachCoffee.name,
                      description: SizeQuantityTotal(
                        sizeList: [smallTotal, mediumTotal, largeTotal],
                      ),
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          backgroundColor: Colors.white,
                          child: EditCoffees(
                              coffeeList: coffeeTotals,
                              coffeeName: eachCoffee.name,
                              onActions: () => closeEditDialog(context)),
                        ),
                      ),
                      icon: const Icon(Icons.edit),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.brown,
                  ),
                  child: Center(
                    child: Text(
                      "Pagar ${priceFormatter(value.coffeesTotalPrice.toString())}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
