import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/models/product_model.dart';

class Cart extends Equatable {
  final List<Product> product;
  const Cart({
    this.product = const <Product>[],
  });

  double get subtotal =>
      product.fold(0, (total, current) => total + current.price);

  double deliveryFree(subtotal) {
    if (subtotal >= 30.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 30.0) {
      return 'You have Free Delivery';
    } else {
      double missing = 30.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for Free Delivery';
    }
  }

  double total(subtotal, deliveryFree) {
    return subtotal + deliveryFree(subtotal);
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total(subtotal, deliveryFree).toStringAsFixed(2);

  String get deliveryFreeString => deliveryFree(subtotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subtotal);

  @override
  List<Object?> get props => [product];
}
