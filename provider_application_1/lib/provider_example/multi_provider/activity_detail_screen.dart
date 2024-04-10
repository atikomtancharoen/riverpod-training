import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import 'activity_detail_provider.dart';

class ActivityDetailScreen extends StatefulWidget {
  const ActivityDetailScreen({super.key, required this.activityKey});

  final String activityKey;

  @override
  State<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
        (_) => context.read<ActivityDetailProvider>().getActivityDetail(widget.activityKey));
  }

  @override
  Widget build(BuildContext context) {
    final activityDetailProvider = context.watch<ActivityDetailProvider>();

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
