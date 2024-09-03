import 'package:flutter_riverpod/flutter_riverpod.dart';

// Провайдер для хранения состояния фильтра
final productFilterProvider = StateProvider<String>((ref) {
  return 'all'; // Фильтр по умолчанию (например, "все категории")
});
