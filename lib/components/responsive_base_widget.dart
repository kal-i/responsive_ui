import 'package:flutter/material.dart';
import 'package:responsive_ui/config/sizing_config.dart';

class ResponsiveBaseWidget extends StatelessWidget {
  final Widget portraitLayout;
  final Widget landscapeLayout;

  const ResponsiveBaseWidget({super.key, required this.portraitLayout, required this.landscapeLayout});

  @override
  Widget build(BuildContext context) {
    if (SizingConfig.isPortrait && SizingConfig.isMobilePortrait) {
      return portraitLayout;
    } else {
      return landscapeLayout;
    }
  }
}

// basically, if portrait and mobile return portrait layout
// then if portrait layout but not mobile, return landscape layout
// the same goes for landscape, just return landscape layout