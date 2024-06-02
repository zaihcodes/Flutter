import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_app/core/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        leading: const Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.settings),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: 150.w,
                height: 150.w,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.asset('assets/images/green_ai_0.jpg'),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'ZaIhCodes',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                'Moroco, Marrakech',
                style: TextStyle(fontSize: 18.sp, color: Colors.grey.shade400),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _profileState('90K', 'Fallowing'),
                  _profileState('50K', 'Fallowers'),
                  _profileState('1.1K', 'Likes')
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 280.h,
                child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
                          dividerColor: Colors.transparent,
                          labelColor: Colors.greenAccent,
                          unselectedLabelColor: Colors.grey.shade400,
                          indicatorColor: Colors.greenAccent,
                          tabs: const [
                            Tab(
                              child: Icon(Icons.list),
                            ),
                            Tab(
                              child: Icon(Icons.grid_view),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            margin: const EdgeInsets.only(top: 10),
                            child: TabBarView(children: [
                              ListView.separated(
                                  // physics: const NeverScrollableScrollPhysics(),
                                  itemCount: Constants.images.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 10,
                                      ),
                                  itemBuilder: (context, index) {
                                    final image = Constants.images[index];
                                    return _postCart(image);
                                  }),
                              GridView.builder(
                                  itemCount: Constants.images.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10,
                                          childAspectRatio: 1),
                                  itemBuilder: (context, index) {
                                    final image = Constants.images[index];
                                    return _postCart(image);
                                  })
                            ]),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileState(String number, String text) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
              fontSize: 22.sp, fontWeight: FontWeight.bold, height: 1.2),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade400),
        ),
      ],
    );
  }

  Widget _postCart(String image) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
