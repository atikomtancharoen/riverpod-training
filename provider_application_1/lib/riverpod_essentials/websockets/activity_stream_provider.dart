import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

/// To synchronously create an object, make sure that your provider does not return a Future:
///
///
final streamExampleProvider = StreamProvider.autoDispose<int>((ref) async* {
  // Every 1 second, yield a number from 0 to 41.
  // This could be replaced with a Stream from Firestore or GraphQL or anything else.
  for (var i = 0; i < 42; i++) {
    yield i;
    await Future<void>.delayed(const Duration(seconds: 1));
  }
});

class HomeStreamScreen extends ConsumerWidget {
  const HomeStreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // The stream is listened to and converted to an AsyncValue.
    AsyncValue<int> value = ref.watch(streamExampleProvider);

    // We can use the AsyncValue to handle loading/error states and show the data.
    return switch (value) {
      AsyncValue(:final error?) => Text('Error: $error'),
      AsyncValue(:final valueOrNull?) => Text('$valueOrNull'),
      _ => const CircularProgressIndicator(),
    };
  }
}
