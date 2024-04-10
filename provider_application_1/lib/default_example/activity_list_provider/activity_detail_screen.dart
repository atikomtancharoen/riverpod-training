import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../activity.dart';
import '../../activity_repository.dart';

class ActivityDetailScreen extends StatefulWidget {
  const ActivityDetailScreen({super.key, required this.activityKey});

  final String activityKey;

  @override
  State<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
  Activity? activity;
  final ActivityRepository _activityRepo = ActivityRepositoryImp();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) => _getActivityDetail());
  }

  void _getActivityDetail() async {
    final resulte = await _activityRepo.getActivityDetail(widget.activityKey);
    setState(() {
      activity = resulte;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Activity Detail"),
        ),
        body: Center(
          child: Column(
            children: [
              Text("activity: ${activity?.activity}"),
              Text("key: ${activity?.key}"),
              Text("type: ${activity?.type}"),
              Text("participants: ${activity?.participants}"),
              Text("price: ${activity?.price}"),
            ],
          ),
        ));
  }
}
