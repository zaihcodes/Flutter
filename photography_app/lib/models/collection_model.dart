import 'package:photography_app/models/post_model.dart';

class CollectionModel {
  final String name;
  final String thumbnail;
  final List<String> tags;
  final List<PostModel> posts;

  CollectionModel(
      {required this.name,
      required this.thumbnail,
      required this.tags,
      required this.posts});
}
