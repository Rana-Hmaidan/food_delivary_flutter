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
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'Favorites'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined), 
            activeIcon: Icon(Icons.person),
            label: 'Profile'
          ),
        ],
        onTap: onItemTapped,
      ),
    );
  }
}