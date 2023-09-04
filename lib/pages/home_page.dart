import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivary/models/category_item.dart';
import 'package:food_delivary/models/food_item.dart';
import 'package:food_delivary/pages/product_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int? selectedCategoryIndex;
  late List<FoodItem> filterdFood;

  @override
  void initState(){
    super.initState();
    filterdFood = food;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.menu),
                        )
                      ),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Current Location',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 18.0,
                                color: Colors.green,
                              ),
                              SizedBox(width:6.0),
                              Text(
                                'Palestine, Nablus',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: (){},
                      child: DecoratedBox(
                       decoration: BoxDecoration(
                           color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.notifications_outlined),
                        )
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    'assets/images/backgimage.jpg',
                     height: 200,
                     width: double.infinity,
                     fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: Colors.grey,
                      ),
                    hintText: 'Find your food ...',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ) 
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsetsDirectional.only(end: 12.0),
                      child: InkWell(
                        onTap: (){ 
                          setState(() {
                            if(selectedCategoryIndex == null || selectedCategoryIndex != index){
                              selectedCategoryIndex = index;
                            }else{
                              selectedCategoryIndex = null;
                              filterdFood = food;
                            }
                        });
                        
                        if(selectedCategoryIndex != null){
                          final selectedCategory = categories[selectedCategoryIndex!];
                          filterdFood = food.where((foodItem) => foodItem.category == selectedCategory.name).toList();
                        }
                        
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: index == selectedCategoryIndex? Colors.deepOrange : Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  categories[index].assetPath,
                                  height: 50,
                                  width: 50,
                                  color: index == selectedCategoryIndex?Colors.white : null,
                                  ),
                                const SizedBox(height: 4.0,),
                                Text(
                                  categories[index].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: index == selectedCategoryIndex? Colors.white : Colors.black54,
                                  ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14.0,  
                    mainAxisSpacing: 14.0 , 
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filterdFood.length,
                  itemBuilder: (context, index ) => InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(foodItem: filterdFood[index],),
                        ),
                      );
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  filterdFood[index].imgUrl,
                                  height: 100,
                                ),
                                Text(
                                 filterdFood[index].name,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                ),
                                ),
                                Text(
                                 filterdFood[index].category,
                                style: const TextStyle(
                                    color: Colors.grey,
                                ),
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                '\$ ${ filterdFood[index].price}',
                                style: const TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                ),
                                ),
                              ]),
                              PositionedDirectional(
                                top: 0,
                                end: 0,
                                child: IconButton(
                                  onPressed: (){
                                  setState(() {
                                    filterdFood[index] = filterdFood[index].copyWith(isFavorite: !filterdFood[index].isFavorite);
                                    final selectedFoodItem = food.firstWhere((item) => item.id == filterdFood[index].id);
                                    final selectedFoodItemIndex = food.indexOf(selectedFoodItem);
                                    food[selectedFoodItemIndex] = filterdFood[index];
                                  });
                                  },
                                  icon: Icon(
                                    filterdFood[index].isFavorite == false ? Icons.favorite_border : Icons.favorite, 
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  } 
}

//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
   // bottomNavigationBar: CurvedNavigationBar(
      //   //key: _bottomNavigationKey,
      //   height: 60.0,
      //   index: _page,
      //   backgroundColor:Colors.white ,
      //   animationCurve: Curves.easeInOut,
      //   animationDuration: const Duration(milliseconds: 400),
      //   color: Colors.white,
      //   items:<Widget>[
      //   Icon(Icons.home_outlined, size: 25),
      //   Icon(Icons.list_outlined, size: 25),
      //   Container(
      //     padding: EdgeInsets.all(12.0),
      //     decoration: BoxDecoration(
      //             color: _page==2 ? Colors.greenAccent :Colors.white,
      //             borderRadius: BorderRadius.circular(50),
      //           ),  
      //     child: Icon(Icons.shopping_cart_outlined, size: 25,color: _page==2 ?Colors.white:Colors.black,)
      //   ),
      //   Icon(Icons.favorite_outline_outlined, size: 25),
      //   Icon(Icons.person_outline_outlined, size: 25),
      //   ],
      //   onTap: (index) {
      //    // _page = index;
      //    },
      //   letIndexChange: (index) => true,
      // ),