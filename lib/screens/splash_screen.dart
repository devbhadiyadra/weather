import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue.shade400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/cloud.png")),
            Text(
              "weather App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SpinKitWave(
              color: Colors.white,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
