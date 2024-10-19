import 'package:flutter/material.dart';

class HealthReport extends StatelessWidget {
  const HealthReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text('Health Report'),
      )),
    );
  }
}
