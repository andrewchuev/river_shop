import 'package:flutter_riverpod/flutter_riverpod.dart';

final productFilterProvider = StateProvider<String>((ref) {
  return 'all';
});
