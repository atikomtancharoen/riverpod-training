import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// To synchronously create an object, make sure that your provider does not return a Future:
///
///
final synchronousExampleProvider = Provider.autoDispose<int>((ref) {
  return 0;
});

class HomeSynchronousScreen extends ConsumerWidget {
  const HomeSynchronousScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        // The value is not wrapped in an "AsyncValue"
        int value = ref.watch(synchronousExampleProvider);

        return Text('$value');
      },
    );
  }
}
