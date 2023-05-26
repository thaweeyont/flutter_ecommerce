import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final dynamic price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isPopular,
    required this.isRecommended,
  });

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isPopular,
        isRecommended,
      ];

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      isPopular: snap['isPopular'],
      isRecommended: snap['isRecommended'],
    );
    return product;
  }

  static List<Product> product = [
    const Product(
      name: 'Soft Drink #1',
      category: 'Soft Drink',
      imageUrl:
          'https://www.mashed.com/img/gallery/reddit-couldnt-believe-this-restaurant-coke-substitution-response/l-intro-1641859551.jpg',
      price: 2.99,
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      name: 'Soft Drink #4',
      category: 'Soft Drink',
      imageUrl:
          'https://www.mashed.com/img/gallery/reddit-couldnt-believe-this-restaurant-coke-substitution-response/l-intro-1641859551.jpg',
      price: 2.99,
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      name: 'Soft Drink #2',
      category: 'Soft Drink',
      imageUrl:
          'https://www.gonnawantseconds.com/wp-content/uploads/2018/06/Planters-Punch-3.jpg',
      price: 2.99,
      isPopular: false,
      isRecommended: true,
    ),
    const Product(
      name: 'Soft Drink #3',
      category: 'Soft Drink',
      imageUrl:
          'https://howtofeedaloon.com/wp-content/uploads/2018/02/Planters_Punch.jpg',
      price: 2.99,
      isPopular: true,
      isRecommended: true,
    ),
    const Product(
      name: 'Smoothies #1',
      category: 'Smoothies',
      imageUrl:
          'https://www.thespruceeats.com/thmb/DTkCRqNWiK8HmlAANacYhMLhN9E=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/strawberry-breakfast-smoothie-recipe-2097149-hero-02-5c1d4b2a46e0fb00014bf2ec.jpg',
      price: 2.99,
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      name: 'Smoothies #2',
      category: 'Smoothies',
      imageUrl:
          'https://www.eatingwell.com/thmb/Q6ZZshsAJU34H4a0PzDvc0PWFFg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/aloe-smoothie-151265e420ef4daa99ab253d241227e3.jpg',
      price: 2.99,
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      name: 'Smoothies #3',
      category: 'Smoothies',
      imageUrl:
          'https://www.dinneratthezoo.com/wp-content/uploads/2018/05/frozen-fruit-smoothie-3.jpg',
      price: 2.99,
      isPopular: true,
      isRecommended: true,
    ),
  ];
}
