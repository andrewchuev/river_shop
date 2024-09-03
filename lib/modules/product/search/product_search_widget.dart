import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_search_provider.dart';

class ProductSearchWidget extends ConsumerWidget {
  const ProductSearchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(productSearchProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Search products...',
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          ref.read(productSearchProvider.notifier).state = value;
        },
      ),
    );
  }
}
