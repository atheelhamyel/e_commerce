import 'package:e_commerce/models/prodect_model.dart';
import 'package:e_commerce/uitls/app_colors.dart';
import 'package:e_commerce/views/widget/carousel_home.dart';
import 'package:flutter/material.dart';

class HomeTabInner extends StatefulWidget {

  const HomeTabInner({super.key});

  @override
  State<HomeTabInner> createState() => _HomeTabInnerState();
}

class _HomeTabInnerState extends State<HomeTabInner> {
  final List<ProductModel> categories = dummyProducts;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CarouselHome(),
          const SizedBox(height: 28),
          GridView.builder(
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              final product = categories[index];
              return InkWell(
                onTap: () {
                  // Add your onTap functionality here
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              product.imgUrl,
                              height: 70,
                              width: 70,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.name,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '\$${product.price}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                            Positioned(
                           top: 10,
                           right: 10,
                            child: DecoratedBox(
                                  decoration: const BoxDecoration(
                                    color: AppColor.white,
                                    shape: BoxShape.circle,
                                  ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            product.isFavorite = !product.isFavorite;
                          });
                        },
                        child:  Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            product.isFavorite?
                            Icons.favorite
                            :Icons.favorite_border,
                          size: 15,
                           color:Theme.of(context).primaryColor,
                          ),
                        ),
                      )),),
                      Positioned(
                        top: 50,
                       right :0,
                        child: IconButton(onPressed: () {
                          setState(() {
                            product.orders = true;
                          });
                        }
                        , icon: const Icon(Icons.add_circle_outline_outlined)),
                      )
                        ]
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
