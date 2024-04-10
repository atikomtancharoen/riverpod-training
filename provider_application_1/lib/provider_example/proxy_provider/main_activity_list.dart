import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'activity_detail_provider.dart';
import 'home_provider.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
        ChangeNotifierProxyProvider<HomeProvider, ActivityDetailProvider>(
          create: (context) {
            return ActivityDetailProvider(context.read<HomeProvider>().selectedActivity);
          },
          update: (context, homeProvider, previous) {
            if (previous == null) return ActivityDetailProvider(homeProvider.selectedActivity);
            if (homeProvider.selectedActivity == previous.activity) return previous;
            previous.activity = homeProvider.selectedActivity;
            return previous;
          },
        ),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
