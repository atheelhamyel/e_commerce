
import 'package:e_commerce/uitls/app_colors.dart';
import 'package:e_commerce/views/pages/cart_page.dart';
import 'package:e_commerce/views/pages/favorite_page.dart';
import 'package:e_commerce/views/pages/home_page.dart';
import 'package:e_commerce/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomButtonNavBar extends StatefulWidget {
  const CustomButtonNavBar({super.key});

  @override
  State<CustomButtonNavBar> createState() => _CustomButtonNavBarState();
}

class _CustomButtonNavBarState extends State<CustomButtonNavBar> {
  // ignore: unused_field
  int _currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const CircleAvatar(
            backgroundImage: NetworkImage('https://t3.ftcdn.net/jpg/06/17/13/26/360_F_617132669_YptvM7fIuczaUbYYpMe3VTLimwZwzlWf.jpg'),
          ),
        ),
        title:  Column(children: [
         Text(
              'Hi, Atheel',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColor.grey2,
                    fontSize: 12,
                    
                  ),
            ),
           Text('Let\'s go sopping',
           style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColor.grey2,
                    fontSize: 12
                  ), ),
        ],),
        actions: [
          IconButton(onPressed: () {
            
          }, icon:const Icon(Icons.search) ),
          IconButton(onPressed: () {
            
          }, icon:const Icon(Icons.notifications) )
        ],    
         ),
      body:  PersistentTabView( 
        onTabChanged:(value) => setState(() {
          _currentIndex=value ;
        }),
      tabs:[
        PersistentTabConfig(
          screen: const HomePage(), 
          item: ItemConfig(icon: const Icon(Icons.home) ,
          title:  'Home',
          activeForegroundColor: AppColor.primary,
          inactiveForegroundColor: AppColor.grey4)),
          PersistentTabConfig(screen: 
          const FavoritePage(),
           item: ItemConfig(icon: const Icon(Icons.favorite),
           title: 'Favorite',
            activeForegroundColor: AppColor.primary,
          inactiveForegroundColor: AppColor.grey4)),
            PersistentTabConfig(screen: 
          CartPage(),
           item: ItemConfig(icon: const Icon(Icons.shopping_bag_sharp),
           title: 'Cart',
           activeForegroundColor: AppColor.primary,
          inactiveForegroundColor: AppColor.grey4
           )), 
           PersistentTabConfig(
            screen: const ProfilePage (),
           item: ItemConfig(icon: const Icon(Icons.person),
           title: 'Person',
           activeForegroundColor: AppColor.primary,
          inactiveForegroundColor: AppColor.grey4)),
           
      ] ,
      navBarBuilder: (navBarConfig)=> Style10BottomNavBar(navBarConfig: navBarConfig)),
    );
  }
}
