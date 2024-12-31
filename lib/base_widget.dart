import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget {
  final Widget builder;

  const BaseWidget({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return builder;
      });
    });
  }
}
