import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ), // change `MultiProvider` to `ProviderScope`
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
