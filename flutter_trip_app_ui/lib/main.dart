import 'package:flutter/material.dart';
import 'package:flutter_trip_app_ui/data.dart';
import 'package:flutter_trip_app_ui/fade_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Nunito'),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: TripData.data.length,
        itemBuilder: (context, index) {
          final trip = TripData.data[index];
          return Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/${trip.image}'),
                        fit: BoxFit.cover)),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.transparent
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: const [0.3, 1])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FadeAnimation(
                        delay: 1.5,
                        child: Text(
                          trip.title,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.5),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                        delay: 2.0,
                        child: Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                tripStar(),
                                tripStar(),
                                tripStar(),
                                tripStar(),
                                tripStar(),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  '4.0',
                                  style: TextStyle(color: Colors.white70),
                                ),
                                const Text(
                                  '(2000)',
                                  style: TextStyle(
                                      color: Colors.white38, fontSize: 12),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                        delay: 2.5,
                        child: Text(
                          trip.description,
                          style: TextStyle(
                              fontSize: 18,
                              height: 1.7,
                              color: Colors.grey.shade500),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                        delay: 2.7,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'READ MORE',
                              style: TextStyle(color: Colors.grey.shade400),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 50,
                right: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      trip.index.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      '/4',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget tripStar() {
    return Container(
      margin: const EdgeInsets.only(right: 3),
      child: const Icon(
        Icons.star,
        color: Colors.yellow,
        size: 15,
      ),
    );
  }
}
