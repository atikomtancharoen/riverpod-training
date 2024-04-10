import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'disposal_provider.dart';

class DisposalScreen3 extends ConsumerStatefulWidget {
  const DisposalScreen3({super.key});

  @override
  DisposalScreen3State createState() => DisposalScreen3State();
}

class DisposalScreen3State extends ConsumerState<DisposalScreen3> {
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
      appBar: AppBar(title: const Text('Screen 3')),
      body: Center(
        child: Column(
          children: [
            Text("${ref.watch(randomNumberProvider(randomNumber))}"),
            TextField(
              controller: myController,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Screen 2'),
            ),
          ],
        ),
      ),
    );
  }
}
