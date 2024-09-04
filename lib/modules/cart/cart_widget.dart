import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'cart_provider.dart';

class CartWidget extends ConsumerWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);

    // Вычисление общей суммы
    final totalAmount = cartItems.fold<double>(
      0,
          (previousValue, cartItem) => previousValue + cartItem.product.price * cartItem.quantity,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return ListTile(
                  leading: Image.network(
                    cartItem.product.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(cartItem.product.title),
                  subtitle: Text('Quantity: ${cartItem.quantity}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          ref.read(cartProvider.notifier).removeFromCart(cartItem.product);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          ref.read(cartProvider.notifier).addToCart(cartItem.product);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Обработка оплаты или очистка корзины
            ref.read(cartProvider.notifier).clearCart();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Thank you for your purchase!'), duration: Duration(milliseconds: 300),),
            );
          },
          child: const Text('Checkout'),
        ),
      ),
    );
  }
}
