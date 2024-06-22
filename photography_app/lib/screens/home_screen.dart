import 'package:flutter/material.dart';
import 'package:photography_app/core/app_colors.dart';
import 'package:photography_app/data/data.dart';
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
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.lightGrey,
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
                      tabs: const [
                        Tab(
                          text: 'Recommend',
                        ),
                        Tab(
                          text: 'Likes',
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Content for Tab 1

                          SingleChildScrollView(
                            child: Column(
                              children: [
                                RecommendWidget(user: UserData.mohammad),
                                const SizedBox(height: 30),
                                RecommendWidget(user: UserData.yasir),
                              ],
                            ),
                          ),
                          // Content for Tab 2
                          SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              child: const Center(
                                child: Text(
                                  'Likes',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
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
