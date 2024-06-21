import 'package:flutter/material.dart';
import 'package:photography_app/core/app_colors.dart';
import 'package:photography_app/models/user_model.dart';

class RecommendWidget extends StatelessWidget {
  const RecommendWidget({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ClipOval(
                  child: SizedBox(
                    height: 55,
                    width: 55,
                    child: Image.asset(user.profilePicture),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        user.name,
                        style: TextStyle(
                          color: AppColors.darkGray,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        user.collection[0].posts[0].location,
                        style: TextStyle(
                          color: AppColors.grey,
                          // fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 18),
                    Text(
                      user.collection[0].posts[0].dateAgo,
                      style: TextStyle(
                        color: AppColors.grey,
                        // fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 290,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildPhotoCard(imgPath: user.collection[0].posts[0].photos[0]),
                SizedBox(width: 20),
                buildPhotoCard(imgPath: user.collection[0].posts[0].photos[1]),
                SizedBox(width: 20),
                buildPhotoCard(imgPath: user.collection[0].posts[0].photos[2]),
              ],
            ),
          )
        ],
      ),
    );
  }

  AspectRatio buildPhotoCard({required String imgPath}) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 20,
                  right: 20,
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                        ),
                        child: Image.asset(
                          'assets/icons/link.png',
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        height: 30,
                        width: 30,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                        ),
                        child: Image.asset(
                          'assets/icons/heart.png',
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
