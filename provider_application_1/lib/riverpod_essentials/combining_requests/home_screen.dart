import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'activity_list_provider.dart';
import 'auth_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final activityProvider = ref.watch(activityAsyncNotifierProvider);
    final authProvider = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              onPressed: () {
                if (authProvider == true) {
                  ref.read(authNotifierProvider.notifier).logout();
                } else {
                  ref.read(authNotifierProvider.notifier).login();
                }
              },
              child: authProvider == true ? const Text('Logout') : const Text('Login'),
            ),
            activityProvider.when(
              data: (data) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(data[index].activity),
                        subtitle: Text(data[index].type),
                      );
                    },
                  ),
                );
              },
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const CircularProgressIndicator(),
            )
          ],
        ),
      ),
      floatingActionButton: (authProvider == true
          ? FloatingActionButton(
              onPressed: () {
                ref.read(activityAsyncNotifierProvider.notifier).addActivity();
              },
              child: const Icon(Icons.add),
            )
          : null),
    );
  }
}
