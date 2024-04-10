import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'disposal_provider.dart';
import 'disposal_screen3.dart';

class DisposalScreen2 extends ConsumerStatefulWidget {
  const DisposalScreen2({super.key});

  @override
  DisposalScreen2State createState() => DisposalScreen2State();
}

class DisposalScreen2State extends ConsumerState<DisposalScreen2> {
  final myController = TextEditingController();
  late int randomNumber;
  @override
  void initState() {
    super.initState();
    randomNumber = Random().nextInt(100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 2')),
      body: Center(
        child: Column(
          children: [
            Text("${ref.watch(randomNumberProvider(randomNumber))}"),
            TextField(
              controller: myController,
            ),
            PopScope(
              canPop: true,
              onPopInvoked: (didPop) {
                ref.invalidate(randomNumberProvider(randomNumber));
              },
              child: const Text('Back to Screen 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DisposalScreen3(),
                  ),
                );
              },
              child: const Text('Open Screen 3!'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            //   child: const Text('Back to Screen 1'),
            // ),
          ],
        ),
      ),
    );
  }
}
