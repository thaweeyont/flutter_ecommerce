import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/models/models.dart';

class Wishlist extends Equatable {
  final List<Product> product;

  const Wishlist({
    this.product = const <Product>[],
  });

  @override
  List<Object?> get props => [product];
}
