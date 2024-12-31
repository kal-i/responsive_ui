import 'package:flutter/material.dart';

import '../config/sizing_config.dart';
import '../constants/assets_path.dart';
import '../theme/app_color.dart';

class SpecialCard extends StatelessWidget {
  const SpecialCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: double.infinity,
          height: SizingConfig.heightMultiplier * 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage(ImagePath.specialCardBackground),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 0,
          height: SizingConfig.imageMultiplier * 45,
          child: Image.asset(ImagePath.specialMenuDish),
        ),
        Positioned(
          left: SizingConfig.widthMultiplier * 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Get special discount',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColor.tertiary,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              Text(
                'up to 50%',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColor.tertiary,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
