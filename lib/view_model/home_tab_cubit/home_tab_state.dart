part of 'home_tab_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<String> announcementImages;
  final List<ProductItemModel> product;

  HomeLoaded({required this.announcementImages, required this.product});
}


class CategoryLoading extends HomeState {}

class CategoryLoaded extends HomeState {
  final List<CategoryModel> categories;

  CategoryLoaded({required this.categories});
}
class CartLoading extends HomeState {}

class CartLoaded extends HomeState {
  final List<ProductModel> cart;
  CartLoaded({required this.cart});
}
class ProfileLoading extends HomeState {}

class ProfileLoaded extends HomeState {
  
}
class FavoriteLoading extends HomeState {}

class FavoriteLoaded extends HomeState {
  final List<ProductModel> favorite ;

  FavoriteLoaded({required this.favorite});
  
}
final class SetFavoriteLoading extends HomeState {
  final String favoritedId;

  SetFavoriteLoading(this.favoritedId);
}

final class SetFavoriteSuccess extends HomeState {
  final String favoritedId;
  final bool isFavorite;

  SetFavoriteSuccess({required this.favoritedId, required this.isFavorite});
}

final class SetFavoriteError extends HomeState {
  final String message;

  SetFavoriteError({
    required this.message,
  });
}