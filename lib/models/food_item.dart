class FoodItem{
  final String id;
  final String name;
  final String category;
  final String imgUrl;
  final double price;
  final String description;
  final String size;
  final int calories;
  final String cooking;
  final String estimatedTime;
  final int numberOfSales;
  final bool isFavorite;
 
 FoodItem({
  required this.id,
  required this.category,
  required this.name,
  required this.imgUrl,
  required this.price,
  required this.description,
  required this.size,
  required this.calories,
  required this.cooking,
  this.estimatedTime ='30 Min',
  this.numberOfSales = 2,
  this.isFavorite = false,
 });

 FoodItem copyWith({bool? isFavorite}){
  return FoodItem(
    id: id, 
    category: category, 
    name: name, 
    imgUrl: imgUrl, 
    price: price,
    description: description,
    size: size,
    calories: calories,
    cooking: cooking,
    numberOfSales: numberOfSales,
    isFavorite: isFavorite ?? this.isFavorite,
  );
 }

}

List<FoodItem> food = [
  FoodItem(
    id: '1',
    category: 'Burger', 
    name: 'Beef Burger', 
    imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPY_xmCOFc3YT5pj19dzLanYmT8VTxNCW2Rg&usqp=CAU', 
    price: 6.99,
    size: 'Medium',
    calories: 150,
    cooking: '30 Min',
    description: 'Loren Ipsum Loren Ipsum Loren Ipsum  Loren Ipsum Loren IpsumLoren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum ',
  ),

  FoodItem(
    id: '2', 
    category: 'Burger', 
    name: 'Chicken Burger', 
    imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMjE6KsPHyR0DiyjYahlWiu5nh6tgmlrA8hA&usqp=CAU', 
    price: 5.99,
    size: 'Medium',
    calories: 150,
    cooking: '30 Min',
    description: 'Loren Ipsum Loren Ipsum Loren Ipsum  Loren Ipsum Loren IpsumLoren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum ',
  ),

  FoodItem(
    id: '3', 
    category: 'Burger', 
    name: 'Cheese Burger', 
    imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDMehMoc57kchtpkCfog-3espJPbm5QbL6Qg&usqp=CAU', 
    price: 7.99,
    size: 'Large',
    calories: 200,
    cooking: '50 Min',
    description: 'Loren Ipsum Loren Ipsum Loren Ipsum  Loren Ipsum Loren IpsumLoren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum ',
  ),

  FoodItem(
    id: '4', 
    category: 'Pizza', 
    name: 'Chicken Pizza', 
    imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0RUl_HdGwuG21M92sr-Epy2qHDS_wKh8PyA&usqp=CAU', 
    price: 6.99,size: 'Large',
    calories: 120,
    cooking: '30 Min',
    description: 'Loren Ipsum Loren Ipsum Loren Ipsum  Loren Ipsum Loren IpsumLoren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum ',
  ),

  FoodItem(
    id: '5', 
    category: 'Pizza', 
    name: 'Margarita  Pizza', 
    imgUrl: 'https://media.istockphoto.com/id/905492462/photo/pizza-margarita-with-mozzarella-cheese-basil-and-tomato-template-for-your-design-and-menu-of.jpg?s=612x612&w=0&k=20&c=J4L7If3oJp0IrZ5IXEc-_r0WU0HNa7U5Yn4IW7ynuVo=', 
    price: 8.99,
    size: 'Medium',
    calories: 160,
    cooking: '30 Min',
    description: 'Loren Ipsum Loren Ipsum Loren Ipsum  Loren Ipsum Loren IpsumLoren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum ',
  ),

  FoodItem(
    id: '6', 
    category: 'Pasta', 
    name: 'Lazania Pasta', 
    imgUrl: 'https://direct.saladservers.com.au/cdn/shop/products/BeefLasagneLarge_800x.jpg?v=1614045153', 
    price: 8.99,
    size: 'Small',
    calories: 100,
    cooking: '20 Min',
    description: 'Loren Ipsum Loren Ipsum Loren Ipsum  Loren Ipsum Loren IpsumLoren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum ',
  ),

  FoodItem(
    id: '7', 
    category: 'Pasta', 
    name: 'koshari', 
    imgUrl: 'https://static.wixstatic.com/media/7f9493_a6e4ce2c09dc4b1e8f878029fc18fd13~mv2.png/v1/fill/w_440,h_438,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/7f9493_a6e4ce2c09dc4b1e8f878029fc18fd13~mv2.png', 
    price: 6.99,
    size: 'Medium',
    calories: 150,
    cooking: '30 Min',
    description: 'Loren Ipsum Loren Ipsum Loren Ipsum  Loren Ipsum Loren IpsumLoren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum ',
  ),

  FoodItem(
    id: '8', 
    category: 'Chicken', 
    name: 'Fried Chicken', 
    imgUrl: 'data:image/jpeg;base64,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', 
    price: 7.99,
    size: 'Large',
    calories: 200,
    cooking: '50 Min',
    description: 'Loren Ipsum Loren Ipsum Loren Ipsum  Loren Ipsum Loren IpsumLoren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum ',
  ),

  FoodItem(
    id: '9', 
    category: 'Chicken', 
    name: 'Grilled Chicken', 
    imgUrl: 'https://static.vecteezy.com/system/resources/previews/021/665/568/original/delicious-grilled-chicken-cutout-png.png', 
    price: 9.99,
    size: 'Medium',
    calories: 150,
    cooking: '30 Min',
    description: 'Loren Ipsum Loren Ipsum Loren Ipsum  Loren Ipsum Loren IpsumLoren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum ',
  ),

  FoodItem(
    id: '10', 
    category: 'Drinks', 
    name: 'CocaCola Drink', 
    imgUrl: 'https://atlas-content-cdn.pixelsquid.com/stock-images/coke-soda-q13q2x2-600.jpg', 
    price: 2.99,
    size: 'Medium',
    calories: 150,
    cooking: '30 Min',
    description: 'Loren Ipsum Loren Ipsum Loren Ipsum  Loren Ipsum Loren IpsumLoren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum Loren Ipsum ',
  ),
  
];