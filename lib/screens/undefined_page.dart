import 'package:flutter/material.dart';

class UndefinedPage extends StatelessWidget {
  const UndefinedPage({super.key, required this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Route for $name is not defined.'
        ),
      ),
    );
  }
}
