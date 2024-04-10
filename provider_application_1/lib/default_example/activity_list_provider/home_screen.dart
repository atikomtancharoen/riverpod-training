import 'package:flutter/material.dart';
import '../../activity.dart';

import '../../activity_repository.dart';
import 'activity_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Activity> activityList = [];
  final ActivityRepository _activityRepo = ActivityRepositoryImp();

  void _addActivity() async {
    final activity = await _activityRepo.getActivity();
    setState(() {
      activityList.add(activity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: activityList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(activityList[index].activity),
              subtitle: Text(activityList[index].key),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActivityDetailScreen(
                        activityKey: activityList[index].key),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addActivity,
        child: const Icon(Icons.add),
      ),
    );
  }
}
