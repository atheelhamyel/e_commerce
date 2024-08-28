import 'package:e_commerce/uitls/app_colors.dart';
import 'package:e_commerce/view_model/cart_cubit/cart_cubit_cubit.dart';
import 'package:e_commerce/views/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartWiget extends StatelessWidget {
  const CartWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColor.primary,
      ),
      child: Positioned(
        top: 0,
        right: 15,
        child: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) {
                  return BlocProvider(
                    create: (context) {
                      final cubit = CartCubit (); // Create an instance of HomeTabCubit
                      cubit.getCartItems(); // Call getCart method on the instance
                      return cubit;
                    },
                    child: const CartPage(),
                  );
                },
              ),
            );
          },
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: AppColor.white,
          ),
        ),
      ),
    );
  }
}
