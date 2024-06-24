import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photography_app/core/app_colors.dart';
import 'package:photography_app/models/post_model.dart';

import '../models/user_model.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({
    super.key,
    required this.image,
    required this.post,
    required this.user,
  });

  final String image;
  final PostModel post;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Column(
        children: [
          _buildImageHeader(context, size),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildLocationRow(),
                  SizedBox(height: 15),
                  Expanded(
                    child: SingleChildScrollView(
                      child: _buildMasonryGrid(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageHeader(BuildContext context, Size size) {
    return Container(
      height: size.height * 0.5,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: 'tag_$image',
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(6, 3, 0, 3),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: [
                ClipOval(
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(user.profilePicture),
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  user.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationRow() {
    return Row(
      children: [
        Image.asset('assets/icons/location.png', width: 20),
        const SizedBox(width: 10),
        Text(
          post.location,
          style: TextStyle(
            color: AppColors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget _buildMasonryGrid() {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: List.generate(post.photos.length, (index) {
        return StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: (index + 1) % 2 + 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(post.photos[index])),
              color: Colors.green,
            ),
          ),
        );
      }),
    );
  }
}
