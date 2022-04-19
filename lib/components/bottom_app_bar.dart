import 'package:flutter/material.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:fuseapp/views/favoriate.dart';
import 'package:fuseapp/views/home.dart';
import 'package:fuseapp/views/profile.dart';
import '../views/cart.dart';
import '../views/home.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int currentIndex = 0;
  final screens = [
    const HomePage(),
    const Profile(),
    const Cart(),
    const Favorite(),
  ];
//todo rawabi insert icon for the unactive + change class name to root
  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              activeIcon: Icon(Icons.shopping_cart_outlined),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              activeIcon: Icon(Icons.favorite_outlined),
              label: "Favorites",
            ),
          ],
        ),
      );
}
