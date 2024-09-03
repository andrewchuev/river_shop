import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_sort_provider.dart';

class ProductSortWidget extends ConsumerWidget {
  const ProductSortWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortCriteria = ref.watch(productSortProvider);

    return DropdownButton<ProductSortCriteria>(
      value: sortCriteria,
      items: const [
        DropdownMenuItem(
          value: ProductSortCriteria.none,
          child: Text('No Sorting'),
        ),
        DropdownMenuItem(
          value: ProductSortCriteria.priceAsc,
          child: Text('Sort by Price: Low to High'),
        ),
        DropdownMenuItem(
          value: ProductSortCriteria.priceDesc,
          child: Text('Sort by Price: High to Low'),
        ),
        DropdownMenuItem(
          value: ProductSortCriteria.nameAsc,
          child: Text('Sort by Name: A to Z'),
        ),
        DropdownMenuItem(
          value: ProductSortCriteria.nameDesc,
          child: Text('Sort by Name: Z to A'),
        ),
      ],
      onChanged: (value) {
        if (value != null) {
          ref.read(productSortProvider.notifier).state = value;
        }
      },
    );
  }
}
