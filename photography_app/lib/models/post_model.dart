import 'package:photography_app/models/user_model.dart';

class PostModel {
  final UserModel? user;
  final String location;
  final String dateAgo;
  final List<String> photos;
  final List<String>? relatedPhotos;

  PostModel(
      {required this.location,
      required this.dateAgo,
      required this.photos,
      this.relatedPhotos,
      this.user});
}
