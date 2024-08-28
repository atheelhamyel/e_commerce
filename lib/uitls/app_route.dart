import 'package:e_commerce/uitls/app_routes.dart';
import 'package:e_commerce/view_model/details_cubit/details_cubit_cubit.dart';
import 'package:e_commerce/views/pages/details_page.dart';
import 'package:e_commerce/views/widget/custom_button_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.productDetails:
        final productId = settings.arguments as String;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = ProductDetailsCubit();
              cubit.getProductDetails(productId);
              return cubit;
            },
            child: const ProductDetailsPage(),
          ),
        );
      case AppRoutes.home:
      default:
        return CupertinoPageRoute(
          builder: (_) => const CustomButtonNavBar(),
        );
    }
  }
}