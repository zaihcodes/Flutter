import 'package:flutter/material.dart';

import '../../model/hotel_model.dart';
import 'hotel_list_item.dart';

class HotelListView extends StatelessWidget {
  const HotelListView({
    super.key,
    required this.theme,
    required this.hotelList,
    required this.animationController,
  });

  final ThemeData theme;
  final List<HotelModel> hotelList;
  final AnimationController? animationController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.scaffoldBackgroundColor,
      child: ListView.builder(
        itemCount: hotelList.length,
        padding: const EdgeInsets.only(top: 8),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          final int count = hotelList.length > 10 ? 10 : hotelList.length;
          final Animation<double> animation =
              Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: animationController!,
                  curve: Interval((1 / count) * index, 1.0,
                      curve: Curves.fastOutSlowIn)));
          animationController?.forward();
          return HotelListItem(
            callback: () {},
            hotelData: hotelList[index],
            animation: animation,
            animationController: animationController!,
          );
          // return Container(
          //   color: Colors.greenAccent,
          // );
        },
      ),
    );
  }
}
