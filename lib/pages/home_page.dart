import 'package:coffee_shop_app/components/bottom_navbar.dart';
import 'package:coffee_shop_app/const.dart';
import 'package:coffee_shop_app/pages/cart_page.dart';
import 'package:coffee_shop_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPageIndex = 0;
  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  void navigateFromBottomBar(pageIndex) {
    setState(() {
      _selectedPageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavbar(
        onTabChange: (index) => navigateFromBottomBar(index),
      ),
    );
  }
}
