import 'package:flutter/material.dart';
import 'package:responsive_ui/components/reusable_button.dart';
import 'package:responsive_ui/config/sizing_config.dart';
import 'package:responsive_ui/constants/assets_path.dart';
import 'package:responsive_ui/constants/routing_constants.dart';

import '../theme/app_color.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        left: false,
        right: false,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagePath.landingImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.4),
                ],
              ),
            ),
            child: Column(
              children: [
                const Expanded(
                  flex: 12,
                  child: _WelcomeContent(),
                ),
                Expanded(
                  child: ReusableButton(
                    onPressed: () => Navigator.pushNamed(context, homePageRoute),
                    text: 'Browse',
                    color: AppColor.iconColor,
                    topBorderRadius: SizingConfig.heightMultiplier * 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _WelcomeContent extends StatelessWidget {
  const _WelcomeContent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizingConfig.heightMultiplier * 2),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 1 * SizingConfig.heightMultiplier),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Ready to explore the world of sushi?',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Anyone who loves sushi is welcome to join our community, where we craft handmade sushi with love and bursting with freshness.',
              textAlign: TextAlign.center,
              softWrap: true,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
