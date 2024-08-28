import 'package:e_commerce/models/cart_model.dart';

sealed class CartState {
  const CartState();
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<CartOrdersModel> cartOrders;
  final double subtotal;
  final double shipping;
  final double totalPrice;

  const CartLoaded({
    required this.cartOrders,
    required this.subtotal,
    required this.shipping,
    required this.totalPrice,
  });

  CartLoaded copyWith({
    List<CartOrdersModel>? cartOrders,
    double? subtotal,
    double? shipping,
    double? totalPrice,
  }) {
    return CartLoaded(
      cartOrders: cartOrders ?? this.cartOrders,
      subtotal: subtotal ?? this.subtotal,
      shipping: shipping ?? this.shipping,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}

final class CartError extends CartState {
  final String message;
  const CartError(this.message);
}

final class QuantityChanging extends CartState {
  final String cartItemId;
  const QuantityChanging(this.cartItemId);
}

final class QuantityChanged extends CartState {
  final int counter;
  final String cartItemId;
  const QuantityChanged(this.counter, this.cartItemId);

  QuantityChanged copyWith({
    int? counter,
    String? cartItemId,
  }) {
    return QuantityChanged(
      counter ?? this.counter,
      cartItemId ?? this.cartItemId,
    );
  }
}
