import 'package:flutter/material.dart';
import 'package:food_delivary/models/food_item.dart';
import 'package:food_delivary/widgets/product_details_property.dart';

class ProductDetailsPage extends StatefulWidget {

  final FoodItem foodItem;

  const ProductDetailsPage({
    super.key,
    required this.foodItem,
    }
  );

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  late FoodItem selectedItem;

  int quantity = 1;

  void _decreaseQuantity() {
    setState(() {
      if(quantity > 1) {
        quantity--;
      }
    });
  }

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  @override
  void initState(){
    super.initState();
    selectedItem = widget.foodItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(selectedItem.name),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                selectedItem = selectedItem.copyWith(isFavorite: !selectedItem.isFavorite);
                final productItem = food.firstWhere((item) => item.id == selectedItem.id);
                final productItemIndex = food.indexOf(productItem);
                food[productItemIndex] = selectedItem;
              });
            }, 
            icon: Icon(
              selectedItem.isFavorite == false ? Icons.favorite_border : Icons.favorite, 
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(width: 8.0,),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image.network(
                          selectedItem.imgUrl,
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                Text(
                                  selectedItem.name,
                                  style: const TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  selectedItem.category,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black45,
                                  ),
                                ),
                               ],
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: quantity > 1 ? _decreaseQuantity : null, 
                                    icon: const Icon(Icons.remove),
                                  ),
                                  const SizedBox(width: 4.0,),
                                  Text(quantity.toString()),
                                  const SizedBox(width: 4.0,),
                                  IconButton(
                                    onPressed: _increaseQuantity, 
                                    icon: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ),
                            ],
                          ),
                          const SizedBox(height: 30.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductDetailsProperty(title: 'Size', value: selectedItem.size,),
                              const SizedBox(
                                width: 40,
                                child: VerticalDivider()
                              ),
                              ProductDetailsProperty(title: 'Calories', value: '${selectedItem.calories} KCal',),
                              const SizedBox(
                                width: 40,
                                child: VerticalDivider()
                              ),
                              ProductDetailsProperty(title: 'Cooking', value: selectedItem.cooking,),
                            ],
                          ),
                          const SizedBox(height: 30.0,),
                          Text(
                            selectedItem.description,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '\$ ${(selectedItem.price * quantity).toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){}, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}