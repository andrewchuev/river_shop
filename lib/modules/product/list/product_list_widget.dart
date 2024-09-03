import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_list_provider.dart';

class ProductListWidget extends ConsumerWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredProductList = ref.watch(filteredProductListProvider);

    return filteredProductList.isEmpty
        ? const Center(child: Text('No products found'))
        : ListView.builder(
      itemCount: filteredProductList.length,
      itemBuilder: (context, index) {
        final product = filteredProductList[index];
        return ListTile(
          leading: Image.network(
            product.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(product.title),
          subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
        );
      },
    );
  }
}
