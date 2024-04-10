import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'activity_detail_provider.dart';

class ActivityDetailScreen extends ConsumerStatefulWidget {
  const ActivityDetailScreen({super.key});

  @override
  ConsumerState<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends ConsumerState<ActivityDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final activityDetailProvider = ref.watch(activityDetailChangeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Activity Detail"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("activity: ${activityDetailProvider.activity?.activity}"),
            Text("key: ${activityDetailProvider.activity?.key}"),
            Text("type: ${activityDetailProvider.activity?.type}"),
            Text("participants: ${activityDetailProvider.activity?.participants}"),
            Text("price: ${activityDetailProvider.activity?.price}"),
          ],
        ),
      ),
    );
  }
}
