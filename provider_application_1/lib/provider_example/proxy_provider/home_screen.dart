import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'activity_detail_screen.dart';
import 'home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: homeProvider.activityList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(homeProvider.activityList[index].activity),
                subtitle: Text(homeProvider.activityList[index].key),
                onTap: () {
                  // Select activity at [index]
                  homeProvider.selectedActivity = homeProvider.activityList[index];
                  // Go to ActivityDetailScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ActivityDetailScreen(),
                    ),
                  );
                },
              );
            },
          ),
          if (homeProvider.isLoading == true)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeProvider>().addActivity();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
