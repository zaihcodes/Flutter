import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photography_app/core/app_colors.dart';
import 'package:photography_app/models/post_model.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({
    super.key,
    required this.image,
    required this.post,
  });

  final String image;
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageHeader(context, size),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildLocationRow(),
                  _buildMasonryGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageHeader(BuildContext context, Size size) {
    return Container(
      height: size.height * 0.5,
      decoration: const BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
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
                    child: Image.asset('assets/users/zaihcodes.jpg'),
                  ),
                ),
                const SizedBox(width: 15),
                const Text(
                  'ZaihCodes',
                  style: TextStyle(
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
          'ZaihCodes',
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
    return MasonryGridView.count(
      crossAxisCount: 4,
      itemCount: post.photos.length,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(post.photos[index])),
            color: Colors.green),
      ),
      // staggeredTileBuilder: (int index) => StaggeredTile.count(2, index.isEven ? 3 : 2),
    );
  }
}
