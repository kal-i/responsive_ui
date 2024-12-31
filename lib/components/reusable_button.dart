import 'package:flutter/material.dart';
import 'package:responsive_ui/config/sizing_config.dart';

import '../theme/app_color.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = AppColor.secondary,
    this.topBorderRadius = 0,
    this.bottomBorderRadius = 0,
    this.elevation = 0,
  });

  final VoidCallback onPressed;
  final String text;
  final Color color;
  final double topBorderRadius;
  final double bottomBorderRadius;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(topBorderRadius),
        bottom: Radius.circular(bottomBorderRadius),
      ),
      color: color,
      elevation: elevation,
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: double.infinity,
        height: SizingConfig.heightMultiplier * 3.75,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
