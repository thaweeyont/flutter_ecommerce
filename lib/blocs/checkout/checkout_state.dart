part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
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
  final Checkout checkout;

  CheckoutLoaded({
    this.fullname,
    this.email,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.product,
    this.subtotal,
    this.deliveryFee,
    this.total,
  }) : checkout = Checkout(
          fullname: fullname,
          email: email,
          address: address,
          city: city,
          country: country,
          zipCode: zipCode,
          product: product,
          subtotal: subtotal,
          deliveryFee: deliveryFee,
          total: total,
        );

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
}
