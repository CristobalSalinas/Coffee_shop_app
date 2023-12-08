import 'package:coffee_shop_app/components/custom_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void enterShop() {
    print("Entrando a la pagina");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: SafeArea(
        child: Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/images/cafe4.png",
                  height: 350,
                  width: 350,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Coffe Shop",
                  style: TextStyle(
                      color: Colors.brown,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Como te gusta tu cafe?",
                  style: TextStyle(color: Colors.brown, fontSize: 20),
                ),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButtom(
                    "Entrar a la tienda",
                    onTap: enterShop,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
