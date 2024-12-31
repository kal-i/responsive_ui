import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/components/reusable_outlined_button.dart';
import 'package:responsive_ui/config/sizing_config.dart';
import 'package:responsive_ui/providers/cart_provider.dart';

import '../models/sushi.dart';
import '../theme/app_color.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.sushi});

  final Sushi sushi;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => context.read<CartProvider>().removeItemToCart(sushi),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizingConfig.widthMultiplier * 2,
            vertical: SizingConfig.heightMultiplier * 2),
        width: double.infinity,
        height: SizingConfig.heightMultiplier * 12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColor.tertiary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: SizingConfig.widthMultiplier * 22,
              height: SizingConfig.heightMultiplier * 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColor.imageBackground,
                image: DecorationImage(
                  image: AssetImage(sushi.imageUrl),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sushi.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColor.primary,
                      ),
                ),
                Text(
                  '\$${sushi.price}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            const _Counter(),
          ],
        ),
      ),
    );
  }
}

class _Counter extends StatelessWidget {
  const _Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ReusableOutlinedButton(
          onTap: () {},
          borderRadius: 5,
          child: Icon(
            Icons.remove_outlined,
            color: AppColor.primary,
            size: SizingConfig.imageMultiplier * 4,
          ),
        ),
        SizedBox(
          width: SizingConfig.widthMultiplier * 2.6,
        ),
        Text(
          '1',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColor.primary,
                fontWeight: FontWeight.w400,
              ),
        ),
        SizedBox(
          width: SizingConfig.widthMultiplier * 2.6,
        ),
        ReusableOutlinedButton(
          onTap: () {},
          borderRadius: 5,
          child: Icon(
            Icons.add_outlined,
            size: SizingConfig.imageMultiplier * 4,
            color: AppColor.primary,
          ),
        ),
      ],
    );
  }
}
