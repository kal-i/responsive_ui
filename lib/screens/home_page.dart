import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/components/special_card.dart';
import 'package:responsive_ui/components/sushi_card.dart';
import 'package:responsive_ui/config/sizing_config.dart';
import 'package:responsive_ui/providers/cart_provider.dart';
import 'package:responsive_ui/theme/app_color.dart';
import '../constants/data.dart';
import '../constants/routing_constants.dart';
import '../models/sushi.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data = jsonDecode(Data.jsonData);
    final List<dynamic> items = data['items'];
    List<Sushi> sushis = [];

    for (var sushi in items) {
      sushis.add(Sushi.fromJson(sushi));
    }

    int cartItems = context.watch<CartProvider>().totalCartItems;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'SASHIMI',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(letterSpacing: 2),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, cartPageRoute),
            icon: cartItems == 0
                ? Icon(
                    Icons.shopping_bag_outlined,
                    size: SizingConfig.imageMultiplier * 7.29,
                  )
                : Container(
                    width: SizingConfig.widthMultiplier * 1.21,
                    height: SizingConfig.heightMultiplier * .56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: SizingConfig.imageMultiplier * 7.29,
                    ),
                  ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 10, vertical: SizingConfig.heightMultiplier * 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpecialCard(),
              SizedBox(
                height: SizingConfig.heightMultiplier * 2.5,
              ),
              const _SearchBar(),
              SizedBox(
                height: SizingConfig.heightMultiplier * 2.5,
              ),
              Text(
                'Popular Menu',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(
                height: SizingConfig.heightMultiplier * 2.5,
              ),
              Expanded(
                child: _MenuList(sushis: sushis),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizingConfig.widthMultiplier * 5.5,
        vertical: SizingConfig.heightMultiplier * 1.5,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.outlineColor,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.circle_outlined,
            color: AppColor.iconColor,
          ),
          SizedBox(
            width: SizingConfig.widthMultiplier * 2.8,
          ),
          Text(
            'Search for food...',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
        ],
      ),
    );
  }
}

class _MenuList extends StatelessWidget {
  const _MenuList({required this.sushis});

  final List<Sushi> sushis;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: sushis.length,
      itemBuilder: (context, index) {
        return SushiCard(
          sushi: sushis[index],
          onPressed: () => context.read<CartProvider>().addItemToCart(sushis[index]),
        );
      },
    );
  }
}
