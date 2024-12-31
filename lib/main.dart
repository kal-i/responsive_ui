import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/constants/routing_constants.dart';
import 'package:responsive_ui/providers/cart_provider.dart';
import 'package:responsive_ui/router.dart' as router;
import 'package:responsive_ui/config/sizing_config.dart';
import 'package:responsive_ui/theme/app_theme.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizingConfig().init(constraints, orientation);
            return ChangeNotifierProvider<CartProvider>(
              create: (_) => CartProvider(),
              child: MaterialApp(
                useInheritedMediaQuery: true,
                locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                theme: AppTheme.getThemeData(),
                onGenerateRoute: router.generateRoute,
                initialRoute: welcomePageRoute,
              ),
            );
          },
        );
      },
    );
  }
}

// OrientationBuilder - detect whether portrait or landscape
// LayoutBuilder - determine the screen size (width and height)
