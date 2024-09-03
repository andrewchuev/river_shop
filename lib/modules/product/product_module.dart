import 'package:flutter/material.dart';
import 'list/product_list_widget.dart';
import 'filter/product_filter_widget.dart';
import 'search/product_search_widget.dart';

class ProductModule extends StatelessWidget {
  static const String routeName = '/product';

  const ProductModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Page'),
      ),
      body: Column(
        children: const [
          ProductSearchWidget(),
          ProductFilterWidget(),
          Expanded(child: ProductListWidget()),
        ],
      ),
    );
  }
}