import 'package:e_commerce_app_ui/core/constants.dart';
import 'package:e_commerce_app_ui/data/product_data.dart';
import 'package:e_commerce_app_ui/screens/home/widgets/categories.dart';
import 'package:e_commerce_app_ui/screens/home/widgets/product_card.dart';
import 'package:e_commerce_app_ui/screens/product/product_screen.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context: context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(theme),
          const Categories(),
          _buildProductGrid(),
        ],
      ),
    );
  }

  Padding _buildHeader(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Text(
        'Women',
        style: theme.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Expanded _buildProductGrid() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: kDefaultPadding,
            crossAxisSpacing: kDefaultPadding,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final product = ProductData.data[index];
            return ProductCard(
              product: product,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductScreen(product: product)),
                );
              },
            );
          },
          itemCount: ProductData.data.length,
        ),
      ),
    );
  }
}
