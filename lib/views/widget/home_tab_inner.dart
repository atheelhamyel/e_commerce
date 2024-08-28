import 'package:e_commerce/uitls/app_routes.dart';
import 'package:e_commerce/view_model/home_tab_cubit/home_tab_cubit.dart';
import 'package:e_commerce/views/widget/carousel_home.dart';
import 'package:e_commerce/views/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabInner extends StatefulWidget {
  const HomeTabInner({super.key});

  @override
  State<HomeTabInner> createState() => _HomeTabInnerState();
}

class _HomeTabInnerState extends State<HomeTabInner> {
  @override
  Widget build(BuildContext context) {
    final homeTabCubit = BlocProvider.of<HomeTabCubit>(context);

    return BlocBuilder<HomeTabCubit, HomeState>(
      bloc: homeTabCubit,
      buildWhen: (previous, current) =>
          current is HomeLoaded || current is HomeLoading,
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeLoaded) {
          final announcements = state.announcementImages;
          final products = state.product;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: CarouselHome(annoucment: announcements),
                  ),
                  const SizedBox(height: 32.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Arrivals',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('See All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  // No need for SizedBox or Expanded here
                  GridView.builder(
                    itemCount: products.length,
                    shrinkWrap: true, // Allows GridView to shrink inside SingleChildScrollView
                    physics: const NeverScrollableScrollPhysics(), // Prevents the GridView from scrolling independently
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pushNamed(
                            AppRoutes.productDetails,
                            arguments: products[index].id,
                          );
                        },
                        child: ProductItem(
                          productItem: products[index],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: Text('An error occurred, please try again later.'),
          );
        }
      },
    );
  }
}
