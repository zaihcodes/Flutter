import 'package:photography_app/models/collection_model.dart';

class UserModel {
  final String name;
  final String profilePicture;
  final String username;
  final int followers;
  final int following;
  final List<CollectionModel> collection;

  UserModel(
      {required this.name,
      required this.profilePicture,
      required this.username,
      required this.followers,
      required this.following,
      required this.collection});
}
