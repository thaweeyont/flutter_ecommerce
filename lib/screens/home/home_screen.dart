import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/models.dart';
import 'package:flutter_ecommerce/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Zero To Wolf'),
      bottomNavigationBar: const CustomNavBar(),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: Category.categories
                .map((category) => HeroCarouselCard(category: category))
                .toList(),
          ),
          const SectionTitle(title: 'RECOMMENDED'),
          ProductCarousel(
              product: Product.product
                  .where((product) => product.isRecommended)
                  .toList()),
          const SectionTitle(title: 'MOST POPULAR'),
          ProductCarousel(
              product: Product.product
                  .where((product) => product.isPopular)
                  .toList()),
        ],
      ),
    );
  }
}
