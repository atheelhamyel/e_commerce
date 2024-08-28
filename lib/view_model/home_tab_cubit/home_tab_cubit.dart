import 'package:e_commerce/models/catogry_model.dart';
import 'package:e_commerce/models/prodect_model.dart';
import 'package:e_commerce/models/product_item.dart' as item;
import 'package:e_commerce/models/prodect_model.dart' as prodect;
import 'package:e_commerce/models/product_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeState> {
  HomeTabCubit() : super(HomeInitial());

  final List<String> imgList = [
    'https://img.freepik.com/free-photo/close-up-woman-holding-shopping-bags_23-2149220711.jpg?size=626&ext=jpg&ga=GA1.1.1141335507.1719014400&semt=ais_user',
    'https://img.freepik.com/free-photo/sale-retail-with-with-special-offer_23-2149656613.jpg?size=626&ext=jpg&ga=GA1.1.471830546.1721057613&semt=ais_user',
    'https://img.freepik.com/premium-vector/sale-girl-is-shouting-into-mouthpiece-about-start-shopping-sales_491047-267.jpg?w=1060',
    'https://img.freepik.com/free-photo/3d-rendering-3d-discount-numbers_52683-92343.jpg?ga=GA1.1.471830546.1721057613&semt=ais_user',
    'https://img.freepik.com/premium-photo/sale-products-with-discount_23-2150296321.jpg?ga=GA1.1.471830546.1721057613&semt=ais_user',
  ];

  void getHomeData() {
    emit(HomeLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(HomeLoaded(announcementImages: imgList, product: dummyProduct));
    });
  }

  void toggleFavorite(item.ProductItemModel productItem) {
    emit(SetFavoriteLoading(productItem.id));
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        if (item.dummyFavorites.contains(productItem)) {
          item.dummyFavorites.remove(productItem);
          emit(SetFavoriteSuccess(favoritedId: productItem.id, isFavorite: false));
        } else {
          item.dummyFavorites.add(productItem);
          emit(SetFavoriteSuccess(favoritedId: productItem.id, isFavorite: true));
        }
      },
    );
  }

  void getCategoryData() {
    emit(CategoryLoading());
    Future.delayed(const Duration(seconds: 1), () {
      // Ensure the correct prefix for dummyCategories
      emit(CategoryLoaded(categories: dummyCategories));
    });
  }

  void getCart() {
    emit(CartLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(CartLoaded(cart: prodect.dummyProducts));
    });
  }

  void getProfile() {
    emit(ProfileLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(ProfileLoaded());
    });
  }

  void getFavorite() {
    emit(FavoriteLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(FavoriteLoaded(favorite: prodect.dummyProducts));
    });
  }
}
