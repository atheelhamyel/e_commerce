import 'package:e_commerce/uitls/app_theme.dart';
import 'package:e_commerce/views/widget/custom_button_navbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      theme: AppTheme.lightTheme(),
    home: const CustomButtonNavBar(),);
  }
}
