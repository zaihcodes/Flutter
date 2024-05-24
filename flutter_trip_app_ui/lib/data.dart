class TripModel {
  final int index;
  final String image;
  final String title;
  final String description;
  final int rating;

  const TripModel(
      {required this.index,
      required this.image,
      required this.title,
      required this.description,
      required this.rating});
}

class TripData {
  static List<TripModel> data = [
    const TripModel(
      index: 1,
      rating: 15000,
      image: 'trip1.jpg',
      title: 'Hagia Sophia, Istanbul',
      description:
          "Hagia Sophia is a magnificent museum in Istanbul, Turkey. Formerly a church, then a mosque, it's now a museum showcasing stunning Byzantine and Islamic architecture and art. (Rated by 1,500 travelers)",
    ),
    const TripModel(
      index: 2,
      rating: 10000,
      image: 'trip2.jpg',
      title: 'The Great Mosque of Mecca, Saudi Arabia',
      description:
          "The holiest site in Islam, The Great Mosque of Mecca, also known as the Kaaba, is a cubical structure in Mecca, Saudi Arabia. Muslims worldwide turn towards the Kaaba during prayers. (Rated by 10,000,000 travelers)",
    ),
    const TripModel(
      index: 3,
      rating: 50000,
      image: 'trip3.jpg',
      title: 'Al-Masjid an-Nabawi, Medina, Saudi Arabia',
      description:
          "The second holiest site in Islam, Al-Masjid an-Nabawi, is the Prophet Muhammad's mosque in Medina, Saudi Arabia. It's a vast complex encompassing the tomb of the Prophet. (Rated by 5,000,000 travelers)",
    ),
    const TripModel(
      index: 4,
      rating: 12000,
      image: 'trip4.jpg',
      title: 'The Dome of the Rock, Jerusalem',
      description:
          "An Islamic shrine located on the Temple Mount in Jerusalem, the Dome of the Rock is a significant landmark known for its stunning golden dome. (Rated by 12,000 travelers)",
    ),
    const TripModel(
      index: 5,
      rating: 20000,
      image: 'trip5.jpg',
      title: 'Sheikh Zayed Grand Mosque, Abu Dhabi',
      description:
          "A stunning example of Islamic architecture, the Sheikh Zayed Grand Mosque in Abu Dhabi features white marble, intricate floral designs, and vast prayer halls. (Rated by 2,000 travelers)",
    )
  ];
}
