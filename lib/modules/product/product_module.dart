import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_shop/modules/product/sort/product_sort_widget.dart';
import 'list/product_list_widget.dart';
import 'filter/product_filter_widget.dart';
import 'search/product_search_widget.dart';
import '../cart/cart_widget.dart';
import '../cart/cart_provider.dart';

class ProductModule extends ConsumerWidget {
  static const String routeName = '/product';

  const ProductModule({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemsCount = ref.watch(cartProvider).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Page'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartWidget()),
              );
            },
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                const Icon(Icons.shopping_cart),
                if (cartItemsCount > 0)
                  Positioned(
                    right: 0,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        cartItemsCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: const [
          ProductSearchWidget(),
          ProductFilterWidget(),
          ProductSortWidget(),
          Expanded(child: ProductListWidget()),
        ],
      ),
    );
  }
}
