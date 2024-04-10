import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';

part 'activity_raw_provider.g.dart';

/// To synchronously create an object, make sure that your provider does not return a Future:
///
///
final streamExampleProvider = Provider.autoDispose<Stream<int>>((ref) async* {
  // Every 1 second, yield a number from 0 to 41.
  // This could be replaced with a Stream from Firestore or GraphQL or anything else.
  for (var i = 0; i < 42; i++) {
    yield i;
    await Future<void>.delayed(const Duration(seconds: 1));
  }
});

/// Using code gen.
///
///
@riverpod
Raw<Stream<int>> rawStream(RawStreamRef ref) {
  return const Stream.empty();
}

class HomeRawScreen extends ConsumerWidget {
  const HomeRawScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // The stream is listened to and converted to an AsyncValue.
    final value = ref.watch(streamExampleProvider);

    // We can use the AsyncValue to handle loading/error states and show the data.
    return switch (value) {
      AsyncValue(:final error?) => Text('Error: $error'),
      AsyncValue(:final valueOrNull?) => Text('$valueOrNull'),
      _ => const CircularProgressIndicator(),
    };
  }
}
