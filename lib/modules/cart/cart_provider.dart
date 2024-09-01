import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../product/product_model.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    state = [
      for (final item in state)
        if (item.id == product.id)
          item.copyWith(quantity: item.quantity + 1)
        else
          item,
      if (!state.any((item) => item.id == product.id))
        product.copyWith(quantity: 1),
    ];
  }

  void removeFromCart(Product product) {
    state = state.where((item) => item.id != product.id).toList();
  }

  double get total {
    return state.fold(0, (sum, item) => sum + item.price * item.quantity);
  }
}
