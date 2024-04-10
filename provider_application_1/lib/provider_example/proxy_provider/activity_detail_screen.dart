import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'activity_detail_provider.dart';

class ActivityDetailScreen extends StatefulWidget {
  const ActivityDetailScreen({super.key});

  @override
  State<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final activityDetailProvider = context.watch<ActivityDetailProvider>();

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
