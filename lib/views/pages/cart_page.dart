import 'package:e_commerce/models/prodect_model.dart';
import 'package:e_commerce/uitls/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CartPage extends StatefulWidget {
  final List<ProductModel> ordersProducts;

  CartPage({super.key})
      : ordersProducts = dummyProducts.where((p) => p.orders).toList();

  int drivary = 5;  

  @override
  State<CartPage> createState() => _CartState();
}

class _CartState extends State<CartPage> {
  double get subtotal {
    return widget.ordersProducts.fold(0, (sum, product) => sum + product.price.toDouble());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          SizedBox(
            height: 50,
            width: 250,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                 children: [
                   const Icon(Icons.pedal_bike_outlined),
                   const SizedBox(width: 5,),
                    Column(
                   children: [
                     const Text('Co_delivery'),
                      Text('15 min',style: Theme.of(context).textTheme.bodyMedium!.
                        copyWith(color: Theme.of(context).primaryColor),)
                       ],
                     ),
                     const SizedBox(width: 20,),
                     const Icon(Icons.toggle_on,)
                     ],
                     ),
              ),
            ),
          ),
          const SizedBox(height: 50,),
          Expanded(
            child: ListView(
              children: widget.ordersProducts.map((product) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 100,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColor.white,
                          ),
                          child: ListTile(
                            leading: Image.network(product.imgUrl),
                            horizontalTitleGap:BorderSide.strokeAlignCenter,
                            title: Text(product.name, style: Theme.of(context).textTheme.labelLarge),
                            subtitle: Text('\$${product.price}', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColor.grey2)),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 60,
                        left: 75,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                          ],
                        ),
                      ),
                      Positioned(
                        top: 60,
                        right: -10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.delete_rounded, color: AppColor.primary),
                              onPressed: () {
                                setState(() {
                                  widget.ordersProducts.remove(product);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: 400,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.white
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColor.grey2)),
                        Text('\$${subtotal.toString()}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('delivery', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColor.grey2)),
                        Text('\$${widget.drivary.toString()}')
                      ],
                    ),
                    const SizedBox(
                      width: 200,
                      height: 5,
                      child: Divider(color: AppColor.primary),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Total', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColor.black)),
                        Text('\$${(subtotal + widget.drivary).toString()}')
                      ],
                    ),
                    const SizedBox(height: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                         
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                        ),
                        child: Text('Checkout', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColor.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}