import 'package:flutter/material.dart';
import 'package:food_delivary/models/food_item.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  
  late List<FoodItem> favoritesFood;

  @override
  void initState(){
    super.initState();
    favoritesFood = food.where((item) => item.isFavorite == true).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favoritesFood.isNotEmpty ? 
      ListView.builder(
          itemCount: favoritesFood.length,
          itemBuilder: (context, index){
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(
                    favoritesFood[index].imgUrl,
                    height: 100,
                    width: 70,
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    favoritesFood[index].name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold, 
                    ),
                  ),
                  subtitle: Text(
                    "${favoritesFood[index].category} - \$${favoritesFood[index].price}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500, 
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: (){
                      setState(() {
                      favoritesFood[index] = favoritesFood[index].copyWith(isFavorite: !favoritesFood[index].isFavorite);
                      final selectedItem = food.firstWhere((item) => item.id == favoritesFood[index].id);
                      final selectedItemIndex = food.indexOf(selectedItem);
                      food[selectedItemIndex] = favoritesFood[index];
                      });
                    },
                    icon: Icon(
                      favoritesFood[index].isFavorite == false ? Icons.favorite_border : Icons.favorite,
                      color: Colors.deepOrange,
                      ),
                  ),
                ),
              ),
            );
          },
      ): const Center(
         child: Text(
          'There is no Favorites food..!',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          ),
         ),
      );
  }
}