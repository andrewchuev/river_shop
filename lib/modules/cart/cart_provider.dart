import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';
import '../product/list/product_list_provider.dart';
import 'cart_item.dart';

// Провайдер для хранения списка товаров в корзине
final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  // Добавить товар в корзину
  void addToCart(Product product) {
    final cartItem = state.firstWhereOrNull((item) => item.product.id == product.id);
    if (cartItem != null) {
      cartItem.quantity += 1;
      state = [...state];
    } else {
      state = [...state, CartItem(product: product)];
    }
  }

  // Удалить товар из корзины
  void removeFromCart(Product product) {
    final cartItem = state.firstWhereOrNull((item) => item.product.id == product.id);
    if (cartItem != null && cartItem.quantity > 1) {
      cartItem.quantity -= 1;
      state = [...state];
    } else {
      state = state.where((item) => item.product.id != product.id).toList();
    }
  }

  // Очистить корзину
  void clearCart() {
    state = [];
  }
}
