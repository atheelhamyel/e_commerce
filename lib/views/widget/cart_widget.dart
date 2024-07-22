import 'package:e_commerce/uitls/app_colors.dart';
import 'package:e_commerce/views/pages/cart_page.dart';
import 'package:flutter/material.dart';
class CartWiget extends StatelessWidget {
 const CartWiget ({super.key});
  final int orderTime = 0; 
  final int discount = 0;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColor.primary
      ),
      child: Positioned(
         top:0,
          right: 15,
                 child: IconButton(onPressed: () {
                  Navigator.of(context).push(
                  MaterialPageRoute(
                   builder: (_) {
                   return  CartPage(
                   
                       );
                         },
                          ),
                           );
                                },
                                 icon: const Icon(Icons.shopping_cart_outlined ,color: AppColor.white,)
                                 ),
                              ),
    );
  }
}