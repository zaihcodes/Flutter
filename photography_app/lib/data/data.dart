import 'package:photography_app/models/collection_model.dart';
import 'package:photography_app/models/post_model.dart';

import '../models/user_model.dart';

class Data {
  static UserModel mohammad = new UserModel(
      name: "Mohammad Rahmani",
      username: "@afgprogrammer",
      followers: 400,
      following: 190,
      profilePicture: "assets/users/mohammad.jpg",
      collection: [
        new CollectionModel(
            name: "Photography",
            tags: ["HD Photos", "Weather", "Photography"],
            thumbnail: "assets/photos/one.jpg",
            posts: [
              new PostModel(
                  location: "Kabul, Afghanistan",
                  dateAgo: "3 min ago",
                  photos: [
                    'assets/photos/one.jpg',
                    'assets/photos/two.jpg',
                    'assets/photos/three.jpg',
                  ]),
              new PostModel(
                  location: "Herat, Afghanistan",
                  dateAgo: "2 week ago",
                  photos: [
                    'assets/photos/six.jpg',
                    'assets/photos/eight.jpg',
                    'assets/photos/two.jpg',
                  ])
            ]),
        new CollectionModel(
            name: "Photography",
            tags: ["HD Photos", "Weather", "Photography"],
            thumbnail: "assets/photos/five.jpg",
            posts: [
              new PostModel(
                  location: "Kabul, Afghanistan",
                  dateAgo: "3 min ago",
                  photos: [
                    'assets/photos/one.jpg',
                    'assets/photos/two.jpg',
                    'assets/photos/three.jpg',
                  ]),
              new PostModel(
                  location: "Herat, Afghanistan",
                  dateAgo: "2 week ago",
                  photos: [
                    'assets/photos/six.jpg',
                    'assets/photos/eight.jpg',
                    'assets/photos/two.jpg',
                  ])
            ]),
      ]);

  static UserModel yasir = new UserModel(
      name: "Yasir Ahmad",
      username: "@yasirnoori.yn",
      followers: 400,
      following: 190,
      profilePicture: "assets/users/yasir.jpg",
      collection: [
        new CollectionModel(
            name: "Photography",
            tags: ["HD Photos", "Weather", "Photography"],
            thumbnail: "assets/photos/two.jpg",
            posts: [
              new PostModel(
                  location: "Kabul, Afghanistan",
                  dateAgo: "3 min ago",
                  photos: [
                    'assets/photos/five.jpg',
                    'assets/photos/six.jpg',
                    'assets/photos/seven.jpg',
                  ]),
              new PostModel(
                  location: "Herat, Afghanistan",
                  dateAgo: "2 week ago",
                  photos: [
                    'assets/photos/six.jpg',
                    'assets/photos/eight.jpg',
                    'assets/photos/two.jpg',
                  ])
            ]),
      ]);

  static PostModel postOne = new PostModel(
      user: mohammad,
      location: "Kabul, Afghanistan",
      dateAgo: "3 min ago",
      photos: [
        'assets/photos/one.jpg',
        'assets/photos/two.jpg',
        'assets/photos/three.jpg'
      ],
      relatedPhotos: [
        'assets/photos/four.jpg',
        'assets/photos/five.jpg',
        'assets/photos/six.jpg',
        'assets/photos/seven.jpg',
        'assets/photos/eight.jpg'
      ]);

  static PostModel postTwo = new PostModel(
      user: yasir,
      location: "Kabul, Afghanistan",
      dateAgo: "3 min ago",
      photos: [
        'assets/photos/four.jpg',
        'assets/photos/five.jpg',
        'assets/photos/six.jpg',
      ],
      relatedPhotos: [
        'assets/photos/one.jpg',
        'assets/photos/two.jpg',
        'assets/photos/three.jpg',
        'assets/photos/four.jpg',
        'assets/photos/five.jpg'
      ]);
}
