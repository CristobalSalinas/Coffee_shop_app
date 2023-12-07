import 'package:coffee_shop_app/components/bottom_navbar.dart';
import 'package:coffee_shop_app/const.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: const Center(
        child: Text("Home PAge"),
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
