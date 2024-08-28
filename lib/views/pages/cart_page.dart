import 'package:e_commerce/uitls/app_colors.dart';
import 'package:e_commerce/view_model/cart_cubit/cart_cubit_cubit.dart';
import 'package:e_commerce/view_model/cart_cubit/cart_cubit_state.dart';
import 'package:e_commerce/views/widget/label_with_value_row.dart';
import 'package:e_commerce/views/widget/main_button.dart';
import 'package:e_commerce/views/widget/order_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);

    return BlocConsumer<CartCubit, CartState>(
      bloc: cartCubit,
      listenWhen: (previous, current) => current is CartError,
      listener: (context, state) {
        if (state is CartError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      buildWhen: (previous, current) =>
          current is CartLoaded || current is CartError || current is CartLoading,
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is CartLoaded) {
          final cartItems = state.cartOrders;
          final subtotal = state.subtotal;
          final shipping = state.shipping;
          final totalPrice = state.totalPrice;

          return RefreshIndicator(
            onRefresh: () async {
              cartCubit.getCartItems();
            },
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ListView.separated(
                  itemCount: cartItems.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(
                      color: AppColor.grey2,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return CartOrderItem(cartItem: cartItems[index]);
                  },
                ),
                const SizedBox(height: 36),
                LabelWithValueRow(
                  label: 'Subtotal',
                  value: '\$$subtotal',
                ),
                const SizedBox(height: 8),
                LabelWithValueRow(
                  label: 'Shipping',
                  value: '\$$shipping',
                ),
                const SizedBox(height: 8),
                Divider(
                  color: AppColor.grey2,
                ),
                const SizedBox(height: 8),
                LabelWithValueRow(
                  label: 'Total',
                  value: '\$$totalPrice',
                ),
                const SizedBox(height: 36),
                MainButton(
                  label: 'Checkout',
                  onPressed: () {
                    // Add checkout logic here
                  },
                ),
              ],
            ),
          );
        } else if (state is CartError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => cartCubit.getCartItems(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
