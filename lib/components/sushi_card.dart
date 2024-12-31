import 'package:flutter/material.dart';
import '../config/sizing_config.dart';
import '../models/sushi.dart';
import '../theme/app_color.dart';

class SushiCard extends StatelessWidget {
  final Sushi sushi;
  final VoidCallback onPressed;

  const SushiCard({super.key, required this.sushi, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizingConfig.widthMultiplier * 50,
      height: SizingConfig.heightMultiplier * 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.tertiary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(sushi.imageUrl),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              sushi.name,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColor.primary),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${sushi.price}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                IconButton.filled(
                  onPressed: onPressed,
                  icon: const Icon(Icons.shopping_cart_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
