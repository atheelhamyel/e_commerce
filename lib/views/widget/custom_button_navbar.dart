import 'package:e_commerce/uitls/app_colors.dart';
import 'package:e_commerce/view_model/cart_cubit/cart_cubit_cubit.dart';
import 'package:e_commerce/view_model/home_tab_cubit/home_tab_cubit.dart';
import 'package:e_commerce/views/pages/cart_page.dart';
import 'package:e_commerce/views/pages/favorite_page.dart';
import 'package:e_commerce/views/pages/home_page.dart';
import 'package:e_commerce/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomButtonNavBar extends StatefulWidget {
  const CustomButtonNavBar({super.key});

  @override
  State<CustomButtonNavBar> createState() => _CustomButtonNavBarState();
}

class _CustomButtonNavBarState extends State<CustomButtonNavBar> {
  // ignore: unused_field
  int _currentIndex = 0; // This variable is now utilized correctly.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://t3.ftcdn.net/jpg/06/17/13/26/360_F_617132669_YptvM7fIuczaUbYYpMe3VTLimwZwzlWf.jpg'),
          ),
        ),
        title: Column(
          children: [
            Text(
              'Hi, Atheel',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColor.grey2,
                    fontSize: 12,
                  ),
            ),
            Text(
              'Let\'s go shopping',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: AppColor.grey2, fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      body: PersistentTabView(
        onTabChanged: (value) => setState(() {
          _currentIndex = value; // Keeps track of the current tab index.
        }),
        tabs: [
          PersistentTabConfig(
            screen: const HomePage(),
            item: ItemConfig(
              icon: const Icon(Icons.home),
              title: 'Home',
              activeForegroundColor: AppColor.primary,
              inactiveForegroundColor: AppColor.grey4,
            ),
          ),
          PersistentTabConfig(
            screen: BlocProvider(
              create: (context) {
                final cubit = HomeTabCubit();
                cubit.getFavorite();
                return cubit;
              },
              child: const FavoritePage(),
            ),
            item: ItemConfig(
              icon: const Icon(Icons.favorite),
              title: 'Favorite',
              activeForegroundColor: AppColor.primary,
              inactiveForegroundColor: AppColor.grey4,
            ),
          ),
          PersistentTabConfig(
            screen: BlocProvider(
              create: (context) {
                final cubit =CartCubit()  ;
                cubit.getCartItems();
                return cubit;
              },
              child: const CartPage(),
            ),
            item: ItemConfig(
              icon: const Icon(Icons.shopping_bag_sharp),
              title: 'Cart',
              activeForegroundColor: AppColor.primary,
              inactiveForegroundColor: AppColor.grey4,
            ),
          ),
          PersistentTabConfig(
            screen: BlocProvider(
              create: (context) {
                final cubit = HomeTabCubit();
                cubit.getProfile(); // Correct usage of cubit method.
                return cubit;
              },
              child: const ProfilePage(),
            ),
            item: ItemConfig(
              icon: const Icon(Icons.person),
              title: 'Profile',
              activeForegroundColor: AppColor.primary,
              inactiveForegroundColor: AppColor.grey4,
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) =>
            Style10BottomNavBar(navBarConfig: navBarConfig),
      ),
    );
  }
}
