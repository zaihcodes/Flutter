import 'package:e_commerce_app_ui/core/widgets/utils.dart';
import 'package:e_commerce_app_ui/model/product_model.dart';
import 'package:e_commerce_app_ui/screens/product/widgets/add_to_cart.dart';
import 'package:e_commerce_app_ui/screens/product/widgets/colors_and_size.dart';
import 'package:e_commerce_app_ui/screens/product/widgets/counter_with_fav_btn.dart';
import 'package:e_commerce_app_ui/screens/product/widgets/product_banner.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    super.key,
    required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: product.color,
      appBar: buildAppBar(
          context: context, color: product.color, iconColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: size.width,
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                    ),
                    // height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        ColorsAndSize(product: product),
                        SizedBox(height: kDefaultPadding / 2),
                        // Description(product: product),
                        buildProductDescription(),
                        SizedBox(height: kDefaultPadding / 2),
                        CounterWithFavBtn(),
                        SizedBox(height: kDefaultPadding),

                        AddToCart(product: product)
                      ],
                    ),
                  ),
                  ProductBanner(product: product)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding buildProductDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
