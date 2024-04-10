import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'disposal_provider.dart';
import 'disposal_screen2.dart';

class DisposalScreen1 extends ConsumerStatefulWidget {
  const DisposalScreen1({super.key});

  @override
  DisposalScreen1State createState() => DisposalScreen1State();
}

class DisposalScreen1State extends ConsumerState<DisposalScreen1> {
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
      appBar: AppBar(title: const Text('Screen 1')),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: myController,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const DisposalScreen2();
                    },
                  ),
                );
              },
              child: const Text('Open 2!'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(randomNumberProvider);
              },
              child: const Text('Clear all Riverpod.'),
            ),
          ],
        ),
      ),
    );
  }
}
