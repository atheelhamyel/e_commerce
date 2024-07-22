import 'package:e_commerce/views/widget/cart_widget.dart';
import 'package:e_commerce/views/widget/category_tab_inner.dart';
import 'package:e_commerce/views/widget/home_tab_inner.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children:[DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Home'),
                Tab(text: 'Category'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  HomeTabInner(),
                  CategoryTabInner(),
                ],
              ),
            ),
          ],
        ),
      ),
          Positioned(
            top: 570,
            right: 20,
            child: CartWiget()),
      ] 
    );
  }
}
