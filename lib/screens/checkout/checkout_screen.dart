import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/blocs/checkout/checkout_bloc.dart';
import 'package:flutter_ecommerce/widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: const CustomNavBar(
        screen: routeName,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
            // BlocBuilder<CheckoutBloc, CheckoutState>(
            //   builder: (context, state) {
            //     if (state is CheckoutLoading) {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //     if (state is CheckoutLoaded) {
            //       return
            Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CUSTOMER INFORMATION',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            _buildTextFormField((value) {
              context.read<CheckoutBloc>().add(UpdateCheckout(email: value));
            }, context, 'Email'),
            _buildTextFormField((value) {
              context.read<CheckoutBloc>().add(UpdateCheckout(fullname: value));
            }, context, 'Full Name'),
            const SizedBox(height: 20),
            Text(
              'DELIVERY INFORMATION',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            _buildTextFormField((value) {
              context.read<CheckoutBloc>().add(UpdateCheckout(address: value));
            }, context, 'Address'),
            _buildTextFormField((value) {
              context.read<CheckoutBloc>().add(UpdateCheckout(city: value));
            }, context, 'City'),
            _buildTextFormField((value) {
              context.read<CheckoutBloc>().add(UpdateCheckout(country: value));
            }, context, 'Country'),
            _buildTextFormField((value) {
              context.read<CheckoutBloc>().add(UpdateCheckout(zipCode: value));
            }, context, 'Zip Code'),
            Text(
              'ORDER SUMMARY',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const OrderSummary(),
          ],
        ),
        // } else {
        //   return const Text('Something went wrong.');
        // }
        // },
      ),
    );
    // );
  }

  Padding _buildTextFormField(
    Function(String)? onChanged,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
