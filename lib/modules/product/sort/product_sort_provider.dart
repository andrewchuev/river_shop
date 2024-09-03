import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ProductSortCriteria { none, priceAsc, priceDesc, nameAsc, nameDesc }

final productSortProvider = StateProvider<ProductSortCriteria>((ref) {
  return ProductSortCriteria.none;
});
