import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/models/models.dart';

class Checkout extends Equatable {
  final String? fullname;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final List<Product>? product;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;

  const Checkout({
    required this.fullname,
    required this.email,
    required this.address,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.product,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  @override
  List<Object?> get props => [
        fullname,
        email,
        address,
        city,
        country,
        zipCode,
        product,
        subtotal,
        deliveryFee,
        total,
      ];

  Map<String, Object> toDocument() {
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipCode'] = zipCode;

    return {
      'customerAddress': customerAddress,
      'customerName': fullname!,
      'customerEmail': email!,
      'product': product!.map((product) => product.name).toList(),
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total!,
    };
  }
}
