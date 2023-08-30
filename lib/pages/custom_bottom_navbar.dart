import 'package:flutter/material.dart';
import 'package:food_delivary/pages/favorites_page.dart';
import 'package:food_delivary/pages/home_page.dart';
import 'package:food_delivary/pages/profile_page.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {

  int selectedIndex = 0;

  List<Widget> widgetBuilder = const [
     HomePage(),
     FavoritesPage(),
     ProfilePage(),
  ];

  void onItemTapped(int index) {
    setState(() {
     selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: widgetBuilder[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex ,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 0 ? Icons.home : Icons.home_outlined,
              ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 1 ? Icons.favorite : Icons.favorite_border,
              ),
            label: 'Favorites'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 2 ?  Icons.person : Icons.person_outline_outlined,
              ), 
            label: 'Profile'
          ),
        ],
        onTap: onItemTapped,
      ),
    );
  }
}