import 'package:coffee_shop_app/components/edit_coffes_tile.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditCoffes extends StatefulWidget {
  final List<int> coffeeList;
  final String coffeeName;
  const EditCoffes({
    super.key,
    required this.coffeeList,
    required this.coffeeName,
  });

  @override
  State<EditCoffes> createState() => _EditCoffesState();
}

class _EditCoffesState extends State<EditCoffes> {
  late List<int> coffeeListValues;

  @override
  void initState() {
    super.initState();
    coffeeListValues = widget.coffeeList;
  }

  void addQuantityToIndexList(int index) {
    setState(() {
      coffeeListValues[index]++;
    });
  }

  void substractQuantityToIndexList(int index) {
    setState(() {
      if (coffeeListValues[index] > 0) {
        coffeeListValues[index]--;
      }
    });
  }

  void editCoffeeList(String coffeeName, List<int> coffeeList) {
    Provider.of<CoffeeShop>(context, listen: false).editItemsFromCard(
      coffeeName,
      coffeeList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          EditCoffesTile(
            title: "P",
            quantity: widget.coffeeList[0],
            addQuantity: () => addQuantityToIndexList(0),
            substractQuantity: () => substractQuantityToIndexList(0),
          ),
          const SizedBox(
            height: 10,
          ),
          EditCoffesTile(
            title: "M",
            quantity: widget.coffeeList[1],
            addQuantity: () => addQuantityToIndexList(1),
            substractQuantity: () => substractQuantityToIndexList(1),
          ),
          const SizedBox(
            height: 10,
          ),
          EditCoffesTile(
            title: "L",
            quantity: widget.coffeeList[2],
            addQuantity: () => addQuantityToIndexList(2),
            substractQuantity: () => substractQuantityToIndexList(2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("Cancelar"),
              ),
              TextButton(
                onPressed: () =>
                    editCoffeeList(widget.coffeeName, coffeeListValues),
                child: const Text("Guardar"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
