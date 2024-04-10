import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'eager_provider.dart';

class EagerScreen extends ConsumerStatefulWidget {
  const EagerScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _EagerScreenState();
  }
}

class _EagerScreenState extends ConsumerState<EagerScreen> {
  @override
  void initState() {
    debugPrint("_EagerScreenState: call initState()");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("_EagerScreenState: call build()");

    final activityProvider = ref.watch(
      eagerActivityProvider(
        (type: 'EagerTest'),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Screen 2')),
      body: Center(
        child: Column(
          children: [
            Text("activity: ${activityProvider.unwrapPrevious().valueOrNull?.activity}"),
            ElevatedButton(
              onPressed: () =>
                  ref.read(eagerActivityProvider((type: 'EagerTest')).notifier).refresh(),
              child: const Text('Click me!'),
            ),
          ],
        ),
      ),
    );
  }
}
