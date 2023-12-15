import 'package:coffee_shop_app/components/edit_coffes_tile.dart';
import 'package:coffee_shop_app/models/coffee_shop_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditCoffees extends StatefulWidget {
  final List<int> coffeeList;
  final String coffeeName;
  final void Function()? onActions;
  const EditCoffees({
    super.key,
    required this.coffeeList,
    required this.coffeeName,
    required this.onActions,
  });

  @override
  State<EditCoffees> createState() => _EditCoffesState();
}

class _EditCoffesState extends State<EditCoffees> {
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

  void editCoffeeList() {
    Provider.of<CoffeeShopTest>(context, listen: false).editCoffeesQuantities(
      widget.coffeeName,
      coffeeListValues,
    );
    widget.onActions!();
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
          Text(
            "Editando ${widget.coffeeName}",
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
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
                onPressed: () => editCoffeeList(),
                child: const Text("Guardar"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
