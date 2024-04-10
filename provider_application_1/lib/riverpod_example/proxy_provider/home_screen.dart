import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'activity_detail_screen.dart';
import 'home_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = ref.watch(homeChangeNotifierProvider);

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
          ref.read(homeChangeNotifierProvider.notifier).addActivity();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
