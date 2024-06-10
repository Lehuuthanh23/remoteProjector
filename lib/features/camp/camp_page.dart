import 'package:flutter/material.dart';

class CampPage extends StatelessWidget {
  const CampPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camp'),
      ),
      body: const Center(
        child: Text('Camp Page'),
      ),
    );
  }
}
