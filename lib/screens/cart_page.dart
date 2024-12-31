import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/components/cart_item.dart';
import 'package:responsive_ui/components/reusable_button.dart';
import 'package:responsive_ui/config/sizing_config.dart';
import 'package:responsive_ui/providers/cart_provider.dart';

import '../models/sushi.dart';
import '../theme/app_color.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().items;

    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        title: Text(
          'Your food cart',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w400,
              ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: _CartList(sushis: cart,),
            ),
            const Divider(
              color: AppColor.secondary,
              thickness: .1,
            ),
            const Expanded(child: _CartTotal()),
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  const _CartList({super.key, required this.sushis});

  final List<Sushi> sushis;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizingConfig.widthMultiplier * 5.3,
          vertical: SizingConfig.heightMultiplier * 3),
      child: ListView.separated(
        itemCount: sushis.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return CartItem(sushi: sushis[index],);
        },
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizingConfig.widthMultiplier * 2.5,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColor.primary,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Text(
                '\$${context.watch<CartProvider>().totalCartPrice}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColor.primary,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: SizingConfig.heightMultiplier * 2.5,
          ),
          ReusableButton(
            onPressed: () => context.read<CartProvider>().removeAllItemsToCart(),
            text: 'Payment',
            topBorderRadius: SizingConfig.heightMultiplier * 2.5,
            bottomBorderRadius: SizingConfig.heightMultiplier * 2.5,
          ),
        ],
      ),
    );
  }
}
