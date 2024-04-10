import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_provider_observer.dart';
import 'logger_screen.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        AppProviderObserver(),
      ],
      child: const MaterialApp(
        home: LoggerScreen1(),
      ),
    ),
  );
}
