import 'package:e_commerce/models/catogry_model.dart';
import 'package:e_commerce/view_model/home_tab_cubit/home_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryTabInner extends StatefulWidget {
  const CategoryTabInner({super.key});

  @override
  State<CategoryTabInner> createState() => _CategoryTabInnerState();
}

class _CategoryTabInnerState extends State<CategoryTabInner> {
  final categories = dummyCategories;

  @override
  Widget build(BuildContext context) {
    final categorys = BlocProvider.of<HomeTabCubit>(context);
    return BlocBuilder<HomeTabCubit, HomeState>(
      bloc: categorys,
      builder: (context, state) {
          if (state is CategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
          }
        else if (state is CategoryLoaded) {
          final listCotegorys = state.categories ;
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: listCotegorys.length,
                    itemBuilder: (_, index) {
                      final category = categories[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                category.imgUrl,
                                height: 150,
                                width: 200,
                                fit: BoxFit.contain,
                              ),
                              Text(category.name),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('Error'));
        }
      },
    );
  }
}
