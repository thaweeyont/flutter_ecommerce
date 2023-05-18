import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String categoey;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.categoey,
    required this.imageUrl,
    required this.price,
    required this.isPopular,
    required this.isRecommended,
  });

  @override
  List<Object?> get props => [
        name,
        categoey,
        imageUrl,
        price,
        isPopular,
        isRecommended,
      ];

  static List<Product> product = [
    const Product(
      name: 'Soft Drink #1',
      categoey: 'Soft Drink',
      imageUrl:
          'https://www.mashed.com/img/gallery/reddit-couldnt-believe-this-restaurant-coke-substitution-response/l-intro-1641859551.jpg',
      price: 2.99,
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      name: 'Soft Drink #4',
      categoey: 'Soft Drink',
      imageUrl:
          'https://www.mashed.com/img/gallery/reddit-couldnt-believe-this-restaurant-coke-substitution-response/l-intro-1641859551.jpg',
      price: 2.99,
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      name: 'Soft Drink #2',
      categoey: 'Soft Drink',
      imageUrl:
          'https://www.gonnawantseconds.com/wp-content/uploads/2018/06/Planters-Punch-3.jpg',
      price: 2.99,
      isPopular: false,
      isRecommended: true,
    ),
    const Product(
      name: 'Soft Drink #3',
      categoey: 'Soft Drink',
      imageUrl:
          'https://howtofeedaloon.com/wp-content/uploads/2018/02/Planters_Punch.jpg',
      price: 2.99,
      isPopular: true,
      isRecommended: true,
    ),
    const Product(
      name: 'Smoothies #1',
      categoey: 'Smoothies',
      imageUrl:
          'https://www.thespruceeats.com/thmb/DTkCRqNWiK8HmlAANacYhMLhN9E=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/strawberry-breakfast-smoothie-recipe-2097149-hero-02-5c1d4b2a46e0fb00014bf2ec.jpg',
      price: 2.99,
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      name: 'Smoothies #2',
      categoey: 'Smoothies',
      imageUrl:
          'https://www.eatingwell.com/thmb/Q6ZZshsAJU34H4a0PzDvc0PWFFg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/aloe-smoothie-151265e420ef4daa99ab253d241227e3.jpg',
      price: 2.99,
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      name: 'Smoothies #3',
      categoey: 'Smoothies',
      imageUrl:
          'https://www.dinneratthezoo.com/wp-content/uploads/2018/05/frozen-fruit-smoothie-3.jpg',
      price: 2.99,
      isPopular: true,
      isRecommended: true,
    ),
  ];
}
