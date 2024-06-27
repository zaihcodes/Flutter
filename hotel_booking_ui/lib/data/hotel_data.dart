import 'package:hotel_booking_ui/model/hotel_model.dart';

class HotelData {
  static List<HotelModel> hotelList = <HotelModel>[
    HotelModel(
      imagePath: 'assets/images/hotel_1.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 180,
    ),
    HotelModel(
      imagePath: 'assets/images/hotel_2.png',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      perNight: 200,
    ),
    HotelModel(
      imagePath: 'assets/images/hotel_3.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      perNight: 60,
    ),
    HotelModel(
      imagePath: 'assets/images/hotel_4.png',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      perNight: 170,
    ),
    HotelModel(
      imagePath: 'assets/images/hotel_5.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 240,
      rating: 4.5,
      perNight: 200,
    ),
  ];

  static List<String> popularFList = <String>[
    'Free Breakfast',
    'Free Parking',
    'Pool',
    'Pet Friendly',
    'Free wifi',
  ];

  static List<String> accomodationList = [
    'All',
    'Apartment',
    'Home',
    'Villa',
    'Hotel',
    'Resort',
  ];
}
