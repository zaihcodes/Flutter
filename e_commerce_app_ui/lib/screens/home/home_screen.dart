import 'package:e_commerce_app_ui/core/constants.dart';
import 'package:e_commerce_app_ui/data/product_data.dart';
import 'package:e_commerce_app_ui/screens/home/widgets/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/back.svg"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              colorFilter: ColorFilter.mode(kTextColor, BlendMode.srcIn),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              colorFilter: ColorFilter.mode(kTextColor, BlendMode.srcIn),
            ),
          ),
          SizedBox(width: kDefaultPaddin / 2),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Text(
              'Women',
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Categories(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = ProductData.data[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(kDefaultPaddin),
                            decoration: BoxDecoration(
                              color: product.color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Hero(
                              tag: "${product.id}",
                              child: Image.asset(product.image),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: kDefaultPaddin / 4,
                        ),
                        Text(
                          // products is out demo list
                          product.title,
                          style: TextStyle(color: kTextLightColor),
                        ),
                        SizedBox(
                          height: kDefaultPaddin / 4,
                        ),
                        Text(
                          "\$${product.price}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  );
                },
                itemCount: ProductData.data.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
