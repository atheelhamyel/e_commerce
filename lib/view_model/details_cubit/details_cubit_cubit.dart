import 'package:e_commerce/models/cart_model.dart';
import 'package:e_commerce/models/product_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'details_cubit_state.dart';
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  ProductSize? size;
  int counter = 1;

  Future<void> getProductDetails(String productId) async {
    emit(ProductDetailsLoading());
    try {
      final product =
          dummyProduct.firstWhere((element) => element.id == productId);
      emit(ProductDetailsLoaded(product));
    } catch (e) {
      emit(ProductDetailsError(e.toString()));
    }
  }

  void incrementCounter() {
    counter++;
    emit(QuantityChanged(counter));
  }

  void decrementCounter() {
    if (counter > 1) {
      counter--;
    }
    emit(QuantityChanged(counter));
  }

  void changeSize(ProductSize value) {
    size = value;
    emit(SizeChanged(size!));
  }

  Future<void> addToCart(ProductItemModel product) async {
    emit(AddingToCart());
    try {
      final cartOrder = CartOrdersModel(
        id: DateTime.now().toIso8601String(),
        product: product,
        totalPrice: counter * product.price,
        quantity: counter,
        size: size!,
      );
      dummyCartOrders.add(cartOrder);
      emit(AddedToCart());
    } catch (e) {
      emit(AddToCartError(e.toString()));
    }
  }
}