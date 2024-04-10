import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'activity_detail_screen.dart';
import 'home_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  // change
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState(); // change
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // change
  @override
  Widget build(BuildContext context) {
    final homeProvider = ref.watch(homeChangeNotifierProvider); // change

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
          ref.read(homeChangeNotifierProvider.notifier).addActivity(); // change
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Consumer
//    Consumer(
//         builder: (context, ref, child) {
//           final homeProvider = ref.watch(homeChangeNotifierProvider);

//           return Column(
//             children: [
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: homeProvider.activityList.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(homeProvider.activityList[index].activity),
//                     subtitle: Text(homeProvider.activityList[index].key),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ActivityDetailScreen(
//                               activityKey: homeProvider.activityList[index].key),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//               if (homeProvider.isLoading == true) const CircularProgressIndicator(),
//             ],
//           );
//         },
//       ),
///