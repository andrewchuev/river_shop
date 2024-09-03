import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_filter_provider.dart';

class ProductFilterWidget extends ConsumerWidget {
  const ProductFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(productFilterProvider);

    return DropdownButton<String>(
      value: filter,
      items: const [
        DropdownMenuItem(value: 'all', child: Text('All Categories')),
        DropdownMenuItem(value: 'electronics', child: Text('Electronics')),
        DropdownMenuItem(value: 'jewelery', child: Text('Jewelery')),
        DropdownMenuItem(
            value: 'men\'s clothing', child: Text('Men\'s Clothing')),
        DropdownMenuItem(
            value: 'women\'s clothing', child: Text('Women\'s Clothing')),
      ],
      onChanged: (value) {
        if (value != null) {
          ref.read(productFilterProvider.notifier).state = value;
        }
      },
    );
  }
}
