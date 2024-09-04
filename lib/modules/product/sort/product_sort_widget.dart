import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_sort_provider.dart';

class ProductSortWidget extends ConsumerWidget {
  const ProductSortWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortCriteria = ref.watch(productSortProvider);

    return DropdownMenu<ProductSortCriteria>(
      width: 200.0,
      initialSelection: sortCriteria,
      dropdownMenuEntries: const [
        DropdownMenuEntry(
          value: ProductSortCriteria.none,
          label: 'No Sorting',
        ),
        DropdownMenuEntry(
          value: ProductSortCriteria.priceAsc,
          label: 'Sort by Price: Low to High',
        ),
        DropdownMenuEntry(
          value: ProductSortCriteria.priceDesc,
          label: 'Sort by Price: High to Low',
        ),
        DropdownMenuEntry(
          value: ProductSortCriteria.nameAsc,
          label: 'Sort by Name: A to Z',
        ),
        DropdownMenuEntry(
          value: ProductSortCriteria.nameDesc,
          label: 'Sort by Name: Z to A',
        ),
      ],
      onSelected: (value) {
        if (value != null) {
          ref.read(productSortProvider.notifier).state = value;
        }
      },
    );
  }
}
