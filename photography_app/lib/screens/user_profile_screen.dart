import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:photography_app/core/app_colors.dart';
import 'package:photography_app/models/collection_model.dart';
import 'package:photography_app/models/user_model.dart';
import 'package:photography_app/screens/post_screen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            SizedBox(height: 20),
            _buildTabSection(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back_ios),
      ),
      actions: [
        InkWell(
          child: Icon(Icons.menu_outlined),
        ),
        SizedBox(width: 15),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      height: 320,
      child: Stack(
        children: [
          Container(
            height: 295,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
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
                  style: TextStyle(color: AppColors.grey),
                ),
                SizedBox(height: 20),
                _buildFollowerFollowingRow(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildActionButtons(),
          ),
        ],
      ),
    );
  }

  Widget _buildFollowerFollowingRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildFollowerStat(widget.user.followers, 'Followers'),
        Container(
          width: 1,
          height: 20,
          margin: EdgeInsets.symmetric(horizontal: 20),
          color: AppColors.lightGrey,
        ),
        _buildFollowerStat(widget.user.following, 'Following'),
      ],
    );
  }

  Widget _buildFollowerStat(int number, String text) {
    return Column(
      children: [
        Text(
          number.toString(),
          style: TextStyle(
            color: AppColors.darkGray,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildActionButton('Follow', AppColors.orange, AppColors.white),
        SizedBox(width: 20),
        _buildActionButton('Message', AppColors.white, AppColors.grey),
      ],
    );
  }

  Widget _buildActionButton(String text, Color bgColor, Color textColor) {
    return GestureDetector(
      child: Container(
        width: 120,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildTabSection() {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: AppColors.orange,
            labelColor: AppColors.black,
            unselectedLabelColor: AppColors.grey,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            tabs: [
              Tab(text: 'Collection'),
              Tab(text: 'Likes'),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 300,
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildCollectionView(),
                Center(child: Text('Likes content')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollectionView() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.user.collection.length,
      separatorBuilder: (context, index) => SizedBox(width: 20),
      itemBuilder: (context, index) {
        return _buildCollectionCard(widget.user.collection[index]);
      },
    );
  }

  Widget _buildCollectionCard(CollectionModel collection) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostScreen(
                    image: collection.thumbnail, post: collection.posts[0])),
          );
        },
        child: Column(
          children: [
            Expanded(
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
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '${collection.posts.length} photos',
                                    style: TextStyle(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            _buildTagsList(collection.tags),
          ],
        ),
      ),
    );
  }

  Widget _buildTagsList(List<String> tags) {
    return Container(
      height: 32,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.grey300,
            ),
            child: Center(
              child: Text(
                tags[index],
                style: TextStyle(color: AppColors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}
