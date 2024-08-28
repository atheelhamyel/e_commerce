import 'package:e_commerce/models/product_item.dart';
import 'package:e_commerce/uitls/app_colors.dart';
import 'package:e_commerce/view_model/home_tab_cubit/home_tab_cubit.dart';
import 'package:e_commerce/views/widget/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<ProductItemModel> favoriteProducts = dummyFavorites.toList() ;
     

  @override
  Widget build(BuildContext context) {
    final cubitFavorite = BlocProvider.of<HomeTabCubit>(context);
    return BlocBuilder<HomeTabCubit, HomeState>(
      bloc: cubitFavorite,
      builder: (context, state) {
        if(state is FavoriteLoading)
        {
          return const Center(
            child: CircularProgressIndicator());
        }
        else if (state is FavoriteLoaded){
        return Stack(children: [
          Scaffold(
            body: Stack(children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Favorite.png',
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(height: 10),
                      GridView.builder(
                        itemCount: favoriteProducts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 16,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          final product = favoriteProducts[index];
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            product.imgUrl,
                                            height: 70,
                                            width: 70,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(product.name),
                                          const SizedBox(height: 8),
                                          Text(
                                            '\$${product.price}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Positioned(
                                        top: 10,
                                        right: 10,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: AppColor.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 50),
                                            child: Icon(
                                              Icons.favorite,
                                              size: 15,
                                              color: AppColor.primary,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(top: 570, right: 20, child: CartWiget())
            ]),
          ),
          const Positioned(top: 570, right: 20, child: CartWiget())
        ]);
        }
         else {
            return const 
    Center(child: Text('Error loading cart'));
          }
      },
    );
  }
}
