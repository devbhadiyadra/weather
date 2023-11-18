import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("weather App"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(1, 0),
              child: Container(
                height: 350,
                width: 350,
                decoration: const BoxDecoration(
                    color: Colors.deepPurple, shape: BoxShape.circle),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1, 0),
              child: Container(
                height: 350,
                width: 350,
                decoration: const BoxDecoration(
                    color: Colors.deepPurple, shape: BoxShape.circle),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, -1),
              child: Container(
                height: 250,
                width: 350,
                decoration: const BoxDecoration(
                    color: Colors.orange, shape: BoxShape.rectangle),
              ),
            ),

            ///BackdropFilter is a widget that applies a filter to the existing painted content beneath it.
            /// This filter can be used to achieve various visual effects, such as blurring, darkening, or applying a color tint to the content behind the BackdropFilter.
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 100, sigmaY: 100, tileMode: TileMode.mirror),
              child: Container(
                decoration: const BoxDecoration(color: Colors.transparent),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("city"),
                    const Gap(25),
                    Container(
                      height: 250,
                      width: 250,
                      decoration: const BoxDecoration(
                          color: Colors.grey, shape: BoxShape.rectangle),
                    ),
                    const Gap(25),
                    const Center(child: Text("21 c")),
                    const Gap(25),
                    const Center(child: Text("THUNDERSTORM")),
                    const Gap(25),
                  ],
                ),
              ),
            )
          ],
        ),
        // decoration: const BoxDecoration(color: Colors.white),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   // crossAxisAlignment: CrossAxisAlignment.end,
        //   children: [
        //     const Gap(50),
        //     const Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       // crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [Icon(Icons.location_on), Text("Delhi")],
        //     ),
        //     const Gap(50),
        //     Container(
        //       decoration: BoxDecoration(
        //           color: Colors.transparent,
        //           borderRadius: BorderRadius.circular(20),
        //           border: Border.all()),
        //       height: 200,
        //       width: 200,
        //     )
        //   ],
        // ),
      ),
    );
  }
}
