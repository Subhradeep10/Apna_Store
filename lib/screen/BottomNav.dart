import 'package:apna_store/const/AppColors.dart';
import 'package:apna_store/screen/BottomNavPages/CartPage.dart';
import 'package:apna_store/screen/BottomNavPages/FavouritePage.dart';
import 'package:apna_store/screen/BottomNavPages/HomePage.dart';
import 'package:apna_store/screen/BottomNavPages/ProfilePage.dart';
import 'package:apna_store/screen/BottomNavPages/SearchScreen.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  final pages = [
    const HomePage(),
    const SearchScreen(),
    const FavouritePage(),
    const CartPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Apna Store",
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 14,
        selectedItemColor: AppColors.primaryColor,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        selectedLabelStyle: const TextStyle(
            color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Favourite'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_shopping_cart,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            print(_selectedIndex);
          });
        },
      ),
      body: pages[_selectedIndex],
    );
  }
}
