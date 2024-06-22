import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:photography_app/core/app_colors.dart';
import 'package:photography_app/models/collection_model.dart';
import 'package:photography_app/models/user_model.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey300,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          InkWell(
            child: Icon(Icons.menu_outlined),
          ),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 320,
              child: Stack(
                children: [
                  Container(
                    height: 295,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        ClipOval(
                          child: SizedBox(
                            height: 85,
                            width: 85,
                            child: Image.asset(widget.user.profilePicture),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          widget.user.name,
                          style: TextStyle(
                            color: AppColors.darkGray,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.user.username,
                          style: TextStyle(
                            color: AppColors.grey,
                            // fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildFallowe(
                              number: widget.user.followers,
                              text: ' Fallowers',
                            ),
                            Container(
                              width: 1,
                              height: 20,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              color: AppColors.lightGrey,
                            ),
                            buildFallowe(
                              number: widget.user.following,
                              text: ' Fallowing',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(0.3),
                                    spreadRadius: 0,
                                    blurRadius: 5,
                                    offset: Offset(0, 1),
                                  )
                                ]),
                            child: Row(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    width: 120,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                    decoration: BoxDecoration(
                                      color: AppColors.orange,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'Fallow',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                GestureDetector(
                                  child: Container(
                                    width: 120,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'Message',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColors.grey, fontSize: 16),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(height: 20),
            DefaultTabController(
              length: 2,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 15, top: 00, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      isScrollable: true,
                      indicatorColor: AppColors.orange,
                      tabAlignment: TabAlignment.start,
                      labelColor: AppColors.black,
                      unselectedLabelColor: AppColors.grey,
                      labelStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      unselectedLabelStyle: TextStyle(),
                      tabs: const [
                        Tab(
                          text: 'Collotion',
                        ),
                        Tab(
                          text: 'Likes',
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 400,
                      child: TabBarView(
                        children: [
                          // Content for Tab 1
                          Column(
                            children: [
                              SizedBox(
                                height: 290,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.user.collection.length,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: 20),
                                  itemBuilder: (context, index) {
                                    return buildCollectionCard(
                                        collection:
                                            widget.user.collection[index]);
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildFallowe({required int number, required String text}) {
    return Container(
      child: Row(
        children: [
          Text(
            number.toString(),
            style: TextStyle(
              color: AppColors.darkGray,
              fontWeight: FontWeight.bold,
              // fontSize: 16,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: AppColors.grey,
              // fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  AspectRatio buildCollectionCard({required CollectionModel collection}) {
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
                  collection.thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            collection.name,
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '${collection.posts.length} photoss',
                            style: TextStyle(
                              color: AppColors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
