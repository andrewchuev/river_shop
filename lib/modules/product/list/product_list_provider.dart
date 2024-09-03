import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../filter/product_filter_provider.dart';
import '../search/product_search_provider.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String category;
  final String image;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      category: json['category'],
      image: json['image'],
    );
  }
}

final productListProvider = FutureProvider<List<Product>>((ref) async {
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products'));

  if (response.statusCode == 200) {
    final List<dynamic> productListJson = jsonDecode(response.body);
    print('***');
    print(productListJson);
    return productListJson.map((json) => Product.fromJson(json)).toList();
  } else {
    print('*** Failed to load products');
    throw Exception('Failed to load products');
  }
});

final filteredProductListProvider = Provider<List<Product>>((ref) {
  final productList = ref.watch(productListProvider).asData?.value ?? [];
  final filter = ref.watch(productFilterProvider);
  final searchQuery = ref.watch(productSearchProvider).toLowerCase();

  return productList.where((product) {
    final matchesFilter = filter == 'all' || product.category == filter;
    final matchesSearch = product.title.toLowerCase().contains(searchQuery);
    return matchesFilter && matchesSearch;
  }).toList();
});
