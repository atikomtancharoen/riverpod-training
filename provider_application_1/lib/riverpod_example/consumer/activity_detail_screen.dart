import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'activity_detail_provider.dart';

class ActivityDetailScreen extends ConsumerStatefulWidget {
  // change
  const ActivityDetailScreen({super.key, required this.activityKey});

  final String activityKey;

  @override
  ConsumerState<ActivityDetailScreen> createState() => _ActivityDetailScreenState(); // change
}

class _ActivityDetailScreenState extends ConsumerState<ActivityDetailScreen> {
  // change
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) => ref
        .read(activityDetailChangeNotifierProvider)
        .getActivityDetail(widget.activityKey)); // change
  }

  @override
  Widget build(BuildContext context) {
    final activityDetailProvider = ref.watch(activityDetailChangeNotifierProvider); // change

    return Scaffold(
      appBar: AppBar(
        title: const Text("Activity Detail"),
      ),
      body: Center(
        child: Column(
          children: (activityDetailProvider.activity == null)
              ? [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  )
                ]
              : [
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
