import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100.w,
                  height: 100.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.asset('assets/images/green_ai_0.jpg'),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ZaIhCodes',
                        style: TextStyle(
                            fontSize: 22.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Moroco, Marrakech',
                        style: TextStyle(
                            fontSize: 14.sp, color: Colors.grey.shade400),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                const Icon(
                  Icons.edit_outlined,
                  color: Colors.grey,
                  size: 25,
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Account',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.h,
            ),
            _accountItem(
                text: 'Notifications',
                subText: 'Turn on/off notifications',
                icon: Icons.notifications,
                bgcolor: Colors.redAccent),
            SizedBox(
              height: 15.h,
            ),
            _accountItem(
              text: 'Privacy',
              subText: 'Privacy settings',
              icon: Icons.lock,
              bgcolor: Colors.green.shade300,
            ),
            SizedBox(
              height: 15.h,
            ),
            _accountItem(
              text: 'Data',
              subText: 'Data usage',
              icon: Icons.data_exploration,
              bgcolor: Colors.amber.shade300,
            ),
            SizedBox(
              height: 15.h,
            ),
            _accountItem(
              text: 'Help',
              subText: 'Help and feedback',
              icon: Icons.data_exploration,
              bgcolor: Colors.blue.shade300,
            ),
            SizedBox(
              height: 15.h,
            ),
            _accountItem(
              text: 'Logout',
              subText: 'Logout',
              icon: Icons.logout,
              bgcolor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget _accountItem(
      {required String text,
      required String subText,
      required IconData icon,
      Color bgcolor = Colors.grey}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80), color: bgcolor),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Icon(
              icon,
              size: 35,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                subText,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade400),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 18,
        )
      ],
    );
  }
}
