import 'package:flutter/material.dart';
import 'package:responsive_ui/config/sizing_config.dart';

import '../theme/app_color.dart';

class ReusableOutlinedButton extends StatelessWidget {
  const ReusableOutlinedButton({
    super.key,
    required this.onTap,
    required this.child,
    this.outlineColor = AppColor.outlineColor,
    this.width = 100,
    this.height = 30,
    this.borderRadius = 0,
  });

  final VoidCallback onTap;
  final Widget child;
  final Color outlineColor;
  final double height;
  final double width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: SizingConfig.widthMultiplier * 8,
        height: SizingConfig.heightMultiplier * 3.7,
        decoration: BoxDecoration(
          border: Border.all(
            color: outlineColor,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    );
  }
}
