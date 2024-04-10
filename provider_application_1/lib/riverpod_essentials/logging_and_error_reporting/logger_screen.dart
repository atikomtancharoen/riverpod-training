import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'logger_provider.dart';

class LoggerScreen1 extends ConsumerStatefulWidget {
  const LoggerScreen1({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LoggerScreen1State();
  }
}

class _LoggerScreen1State extends ConsumerState<LoggerScreen1> {
  @override
  Widget build(BuildContext context) {
    final activityProvider = ref.watch(
      loggerActivityProvider,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Screen 1')),
      body: Center(
        child: Column(
          children: [
            activityProvider.when(
              data: (data) => Text("activity: ${data.activity}, type: ${data.type}"),
              error: (error, stackTrace) => const Text('Oops, something unexpected happened'),
              loading: () => const CircularProgressIndicator(),
            ),
            ElevatedButton(
              onPressed: () => ref.read(loggerActivityProvider.notifier).refresh(),
              child: const Text('Click me!'),
            ),
          ],
        ),
      ),
    );
  }
}
