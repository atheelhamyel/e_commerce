import 'package:e_commerce/models/cart_model.dart';
import 'package:e_commerce/view_model/cart_cubit/cart_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void getCartItems() {
    emit(CartLoading());
    try {
      final cartOrders = dummyCartOrders; // Replace this with your data fetching logic
      _emitCartLoadedState(cartOrders);
    } catch (e) {
      emit(CartError('Failed to fetch cart items: ${e.toString()}'));
    }
  }

  void incrementCounter(int previousValue, String cartItemId) {
    _updateCounter(previousValue + 1, cartItemId);
  }

  void decrementCounter(int previousValue, String cartItemId) {
    if (previousValue > 1) {
      _updateCounter(previousValue - 1, cartItemId);
    } else {
      emit(const CartError('Quantity cannot be less than 1'));
    }
  }

  void _updateCounter(int newValue, String cartItemId) {
    emit(QuantityChanging(cartItemId));
    Future.delayed(const Duration(seconds: 1), () {
      // Perform additional checks or updates here if needed
      emit(QuantityChanged(newValue, cartItemId));
    });
  }

  void _emitCartLoadedState(List<CartOrdersModel> cartOrders) {
    final subtotal = cartOrders.fold<double>(
      0,
      (previousValue, element) =>
          previousValue + (element.quantity * element.product.price),
    );
    const shipping = 10.0;
    final totalPrice = subtotal + shipping;

    emit(CartLoaded(
      cartOrders: cartOrders,
      subtotal: subtotal,
      shipping: shipping,
      totalPrice: totalPrice,
    ));
  }
}
