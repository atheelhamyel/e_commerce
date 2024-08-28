import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/uitls/app_route.dart';
import 'package:e_commerce/uitls/app_routes.dart';
import 'package:e_commerce/uitls/app_theme.dart';
import 'package:e_commerce/views/widget/custom_button_navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future< void >main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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
       initialRoute: AppRoutes.home,
      onGenerateRoute: AppRouter.onGenerateRoute,
    home: const CustomButtonNavBar(),);
  }
}
