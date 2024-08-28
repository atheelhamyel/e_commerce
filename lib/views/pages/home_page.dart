import 'package:e_commerce/view_model/home_tab_cubit/home_tab_cubit.dart';
import 'package:e_commerce/views/widget/cart_widget.dart';
import 'package:e_commerce/views/widget/category_tab_inner.dart';
import 'package:e_commerce/views/widget/home_tab_inner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Home'),
                Tab(text: 'Category'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  BlocProvider(
                    create: (context) {
                      final cubit = HomeTabCubit();
                      cubit.getHomeData();
                      return cubit;
                    },
                    child: const HomeTabInner(),
                  ),
                  BlocProvider(
                    create: (context)  {
                      final cubit =HomeTabCubit();
                      cubit.getCategoryData();
                      return cubit ;
                    },
                    child: const CategoryTabInner(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const Positioned(top: 570, right: 20, child: CartWiget()),
    ]);
  }
}
