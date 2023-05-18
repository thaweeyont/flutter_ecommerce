import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/product_model.dart';

import 'product_card.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> product;
  const ProductCarousel({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: product.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Productcard(product: product[index]),
            );
          }),
    );
  }
}