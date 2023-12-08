import 'package:coffee_shop_app/sections/cart_section.dart';
import 'package:coffee_shop_app/sections/shop_section.dart';
import 'package:coffee_shop_app/const.dart';
import 'package:flutter/material.dart';

import '../components/bottom_navbar.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int _selectedPageIndex = 0;
  final List<Widget> _pages = [
    const CartSection(),
    const ShopSection(),
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
