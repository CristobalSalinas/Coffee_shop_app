import 'package:coffee_shop_app/components/coffee_tile_test.dart';
import 'package:coffee_shop_app/components/size_quantity_total.dart';
import 'package:coffee_shop_app/const.dart';
import 'package:coffee_shop_app/models/coffee.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartSection extends StatefulWidget {
  const CartSection({super.key});

  @override
  State<CartSection> createState() => _CartSectionState();
}

class _CartSectionState extends State<CartSection> {
  void removeCoffe(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).remoteItemFromCart(coffee);
  }

  void payCoffees() {
    print("Paga mierda!!");
  }

  Map<String, Map> distributeCoffeeSizes(List<Coffee> coffees) {
    Map<String, Map> coffeeList = {};
    Map<CoffeeSize, int> coffeeSize = {
      CoffeeSize.small: 0,
      CoffeeSize.medium: 1,
      CoffeeSize.large: 2,
    };

    for (var coffee in coffees) {
      if (coffeeList[coffee.name] == null) {
        coffeeList[coffee.name] = {
          "name": coffee.name,
          "size": [0, 0, 0],
          "image": coffee.imagePath,
        };
      }
      int size = coffeeSize[coffee.size]!;
      var coffeeObj = coffeeList[coffee.name]!;
      List<int> values = coffeeObj["size"];
      values[size] = values[size] + 1;
      coffeeObj["size"] = values;
      coffeeList[coffee.name] = coffeeObj;
    }

    return coffeeList;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (context, value, child) {
      var coffeSizesList = distributeCoffeeSizes(value.userCart);
      var coffeeListKeys = coffeSizesList.keys.toList();

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
                  itemCount: coffeeListKeys.length,
                  itemBuilder: (context, index) {
                    var coffeeObject = coffeSizesList[coffeeListKeys[index]]!;

                    return CoffeeTileTest(
                      image: coffeeObject["image"].toString(),
                      title: coffeeObject["name"].toString(),
                      description:
                          SizeQuantityTotal(sizeList: coffeeObject["size"]),
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: payCoffees,
                child: Container(
                  padding: EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.brown,
                  ),
                  child: const Center(
                    child: Text(
                      "Pagar",
                      style: TextStyle(
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
