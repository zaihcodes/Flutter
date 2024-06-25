import 'package:e_commerce_app_ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'core/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZaIhCodes',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}
