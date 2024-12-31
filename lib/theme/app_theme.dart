import 'package:flutter/material.dart';
import 'package:responsive_ui/config/sizing_config.dart';
import 'app_color.dart';

class AppTheme {

  static ThemeData getThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.background,
      fontFamily: 'Josh',
      textTheme: TextTheme(
        headlineSmall: TextStyle(color: AppColor.headlineText, fontSize: SizingConfig.textMultiplier * 3, fontWeight: FontWeight.w700),
        headlineMedium: TextStyle(color: AppColor.headlineText, fontSize: SizingConfig.textMultiplier * 3.5, fontWeight: FontWeight.w900),
        headlineLarge: TextStyle(color: AppColor.overlayText, fontSize: SizingConfig.textMultiplier * 4 , fontWeight: FontWeight.w800),
        bodySmall: TextStyle(color: AppColor.bodyText, fontSize: SizingConfig.textMultiplier * 1.5, fontWeight: FontWeight.w300),
        bodyMedium: TextStyle(color: AppColor.overlayText, fontSize: SizingConfig.textMultiplier * 2, fontWeight: FontWeight.w400),
        bodyLarge: TextStyle(color: AppColor.bodyText, fontSize: SizingConfig.textMultiplier * 2.5, fontWeight: FontWeight.w700),
      ),
      iconTheme: const IconThemeData(
          color: Colors.white,
          size: 24.0
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColor.primary,
        onPrimary: AppColor.primary,
        secondary: AppColor.secondary,
        onSecondary: AppColor.secondary,
        background: AppColor.background,
        onBackground: AppColor.background,
      ),
    );
  }

  // static ThemeData get light => ThemeData();
  // static ThemeData get dark => ThemeData();
}