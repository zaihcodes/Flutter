import 'package:flutter/material.dart';
import 'package:hotel_booking_ui/core/app_theme.dart';
import 'package:hotel_booking_ui/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: HotelHomeScreen(),
    );
  }
}
