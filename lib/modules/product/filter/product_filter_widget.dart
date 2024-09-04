import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_filter_provider.dart';

class ProductFilterWidget extends ConsumerWidget {
  const ProductFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(productFilterProvider);

    return DropdownMenu<String>(
      width: 150.0,
      initialSelection: filter,
      dropdownMenuEntries: const [
        DropdownMenuEntry(value: 'all', label: 'All Categories'),
        DropdownMenuEntry(value: 'electronics', label: 'Electronics'),
        DropdownMenuEntry(value: 'jewelery', label: 'Jewelery'),
        DropdownMenuEntry(value: 'men\'s clothing', label: 'Men\'s Clothing'),
        DropdownMenuEntry(value: 'women\'s clothing', label: 'Women\'s Clothing'),
      ],
      onSelected: (value) {
        if (value != null) {
          ref.read(productFilterProvider.notifier).state = value;
        }
      },
    );
  }
}
