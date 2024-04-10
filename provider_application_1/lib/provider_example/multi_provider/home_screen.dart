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
            itemCount: homeProvider.activityList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(homeProvider.activityList[index].activity),
                subtitle: Text(homeProvider.activityList[index].key),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ActivityDetailScreen(activityKey: homeProvider.activityList[index].key),
                    ),
                  );
                },
              );
            },
          ),
          if (homeProvider.isLoading == true) const CircularProgressIndicator(),
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

/// Consumer
/// 
/// Consumer<HomeProvider>(builder: (context, homeProvider, child) { .... }
///