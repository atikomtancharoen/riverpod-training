import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'activity_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final social = ref.watch(activityProvider('2300257'));
        final relaxation = ref.watch(activityProvider('1668223'));

        // We can then render both activities.
        // Both requests will happen in parallel and correctly be cached.
        return Column(
          children: [
            Text(social.valueOrNull?.activity ?? ''),
            Text(relaxation.valueOrNull?.activity ?? ''),
          ],
        );
      },
    );
  }
}
