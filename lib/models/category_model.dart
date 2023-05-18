import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    const Category(
      name: 'Soft Drink',
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0255/9616/6180/files/Lime_Mint_3_1024x1024.png?v=1652779124',
    ),
    const Category(
      name: 'Smoothies',
      imageUrl:
          'https://bakedbree.com/wp-content/uploads/2012/09/make-ahead-smoothie-RESHOOT-10-scaled.jpg',
    ),
    const Category(
      name: 'Water',
      imageUrl:
          'https://4.bp.blogspot.com/-PLXR4B_n47o/V9gniaA9SHI/AAAAAAAAVYQ/nfYwTqOHtjQeUpif9XwShn6WZsj_U9zOwCLcB/s1600/%25E0%25B8%259A%25E0%25B8%25A3%25E0%25B8%25A3%25E0%25B8%2588%25E0%25B8%25B8%25E0%25B8%25A0%25E0%25B8%25B1%25E0%25B8%2593%25E0%25B8%2591%25E0%25B9%258C%25E0%25B8%2582%25E0%25B8%25A7%25E0%25B8%2594%25E0%25B8%2599%25E0%25B9%2589%25E0%25B8%25B3%25E0%25B8%2594%25E0%25B8%25B7%25E0%25B9%2588%25E0%25B8%25A1%25E0%25B8%25AA%25E0%25B8%25A7%25E0%25B8%25A2%25E0%25B9%2586%25E0%25B8%2588%25E0%25B8%25B2%25E0%25B8%2581%2BHealthy%2BWater%2Bby%2BNailia%2BMazitova%2B%25E0%25B8%2588%25E0%25B8%25B2%25E0%25B8%2581%2BBunjupun.com.png',
    ),
  ];
}
