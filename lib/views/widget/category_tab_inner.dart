import 'package:e_commerce/models/catogry_model.dart';
import 'package:flutter/material.dart';

class CategoryTabInner extends StatefulWidget {
  const CategoryTabInner({super.key});

  @override
  State<CategoryTabInner> createState() => _CategoryTabInnerState();
}

class _CategoryTabInnerState extends State<CategoryTabInner> {
  final categories = dummyCategories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
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
                        Text(category.name)
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
  }
}
