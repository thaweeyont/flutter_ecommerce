import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/blocs/cart/cart_bloc.dart';
import 'package:flutter_ecommerce/blocs/checkout/checkout_bloc.dart';
import 'package:flutter_ecommerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter_ecommerce/models/product_model.dart';

class CustomNavBar extends StatelessWidget {
  final String screen;
  final Product? product;

  const CustomNavBar({
    super.key,
    required this.screen,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _selectNavbar(context, screen)!,
        ),
      ),
    );
  }

  List<Widget>? _selectNavbar(context, screen) {
    switch (screen) {
      case '/':
        return _buildNavBar(context);
      case '/catalog':
        return _buildNavBar(context);
      case '/wishlist':
        return _buildNavBar(context);
      case '/product':
        return _buildAddToCartNavbar(context, product);
      case '/cart':
        return _buildGoToCheckoutNavbar(context);
      case '/checkout':
        return _buildOrderNowNavbar(context);

      default:
        _buildNavBar(context);
    }
    return null;
  }

  List<Widget> _buildNavBar(context) {
    return [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        icon: const Icon(Icons.home, color: Colors.white),
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        icon: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/user');
        },
        icon: const Icon(Icons.person, color: Colors.white),
      ),
    ];
  }

  List<Widget> _buildAddToCartNavbar(context, product) {
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.share, color: Colors.white),
      ),
      BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          return IconButton(
            onPressed: () {
              context.read<WishlistBloc>().add(AddProductToWishlist(product));

              final snackBar =
                  const SnackBar(content: Text('Added to your Wishlist!'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: const Icon(Icons.favorite, color: Colors.white),
          );
        },
      ),
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {
              context.read<CartBloc>().add(AddProduct(product));

              Navigator.pushNamed(context, '/cart');
            },
            child: Text(
              'ADD TO CART',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          );
        },
      )
    ];
  }

  List<Widget> _buildGoToCheckoutNavbar(context) {
    return [
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/checkout');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(),
        ),
        child: Text(
          'GO TO CHECKOUT',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      )
    ];
  }

  List<Widget> _buildOrderNowNavbar(context) {
    return [
      BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CheckoutLoaded) {
            return ElevatedButton(
              onPressed: () {
                context
                    .read<CheckoutBloc>()
                    .add(ConfirmCheckout(checkout: state.checkout));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(),
              ),
              child: Text(
                'ORDER NOW',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            );
          } else {
            return const Text('Something went wrong.');
          }
        },
      )
    ];
  }
}
