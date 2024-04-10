import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final randomNumberProvider = Provider.family<int, int>((ref, arg) {
  ref.onDispose(() {
    debugPrint('arg: $arg');
  });
  return arg;
});
