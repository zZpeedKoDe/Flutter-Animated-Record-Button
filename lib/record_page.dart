import 'package:flutter/material.dart';
import 'package:record_button/record_button.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Record Page'),
      ),
      body: const Center(
        child: RecordButton(),
      ),
    );
  }
}