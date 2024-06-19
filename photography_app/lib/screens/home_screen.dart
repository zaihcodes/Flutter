import 'package:flutter/material.dart';
import 'package:photography_app/core/app_colors.dart';
import 'package:photography_app/widgets/recommend_widget.dart';
import 'package:photography_app/widgets/search_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey300,
      appBar: AppBar(
        backgroundColor: AppColors.grey300,
        leading: Icon(Icons.menu),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          SearchBox(),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'For you',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    TabBar(
                      isScrollable: true,
                      indicatorColor: AppColors.orange,
                      tabAlignment: TabAlignment.start,
                      labelColor: AppColors.black,
                      unselectedLabelColor: AppColors.grey,
                      labelStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      unselectedLabelStyle: TextStyle(),
                      tabs: [
                        Tab(
                          text: 'Recommend',
                        ),
                        Tab(
                          text: 'Likes',
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Content for Tab 1

                          SingleChildScrollView(
                            child: Column(
                              children: [
                                RecommendWidget(
                                  username: 'ZaihCodes',
                                  profilePicture: 'assets/users/mohammad.jpg',
                                  location: 'Marrakech, Moroco',
                                  dateAgo: '3 min ago',
                                  photos: [
                                    'assets/photos/one.jpg',
                                    'assets/photos/two.jpg',
                                    'assets/photos/three.jpg',
                                    'assets/photos/four.jpg',
                                  ],
                                ),
                                SizedBox(height: 30),
                                RecommendWidget(
                                  username: 'ZaihCodes',
                                  profilePicture: 'assets/users/yasir.jpg',
                                  location: 'Marrakech, Moroco',
                                  dateAgo: '3 min ago',
                                  photos: [
                                    'assets/photos/five.jpg',
                                    'assets/photos/six.jpg',
                                    'assets/photos/seven.jpg',
                                    'assets/photos/eight.jpg',
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Content for Tab 2
                          SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Text('Content for Tab 2'),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
