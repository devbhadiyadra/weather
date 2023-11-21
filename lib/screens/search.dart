import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

import 'package:intl/intl.dart';

import 'package:weatherapp/helper_function/helper.dart';
import 'package:weatherapp/model/model.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

TextEditingController city_name_controller = TextEditingController();
// String strName = "dec";
// int? id;

bool state = false;
double temp = 15.5;
String name = "load...";
int sunrise = 15;
int sunset = 15;
double temp_max = 15.5;
double temp_min = 15.5;
double? temp_value;
double? temp_min_C;
double? temp_max_C;
String? sunrise_time;
String? sunset_time;

class _searchState extends State<search> {
  Future<void> start(city) async {
    try {
      model obj = model(location: city);
      await obj.getData();
      state = true;
      print(obj.sunrise);
      setState(() {
        temp = obj.temp!;
        name = obj.name.toString();
        sunrise = obj.sunrise!;
        sunset = obj.sunset!;
        temp_max = obj.temp_max!;
        temp_min = obj.temp_min!;
      });

      sunrise_time = helper.getDate(sunrise);
      sunset_time = helper.getDate(sunset);

      temp_value = helper.fahrenheitToCelsius(temp);
      temp_max_C = helper.fahrenheitToCelsius(temp_max);

      temp_min_C = helper.fahrenheitToCelsius(temp_min);
    } catch (e) {
      Fluttertoast.showToast(msg: "please enter valid city name");
    }
  }

  @override
  void initState() {
    super.initState();
    // start();
  }

  // Future<dynamic> search() async {
  //   // WeatherFactory wf = WeatherFactory(API_KEY);
  //   // Weather weather =
  //   //     await wf.currentWeatherByCityName(city_name_controller.text);
  //   String cityName = city_name_controller.text.trim();
  //   Response response = await http.get(Uri.parse(
  //       "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=ce1463449767f059b255fa59d6345b70"));
  //   print(response.statusCode);

  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     // print(data.toString());
  //     final id = data['id'];
  //     setState(() {
  //       // strName = name;
  //       id != id;
  //     });

  //     print('name ${id.toString()}');

  //     // print(response.body.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(-1, 1),
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.blue.shade300, shape: BoxShape.circle),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(1, 1),
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.blue.shade300, shape: BoxShape.circle),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, -1),
              child: Container(
                height: 400,
                width: 350,
                decoration: const BoxDecoration(
                    color: Colors.orange, shape: BoxShape.rectangle),
              ),
            ),
            // Align(
            //   alignment: const AlignmentDirectional(1, 1),
            //   child: Container(
            //     height: 150,
            //     width: 350,
            //     decoration: BoxDecoration(
            //         color: Colors.pink, shape: BoxShape.rectangle),
            //   ),
            // ),

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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: TextField(
                controller: city_name_controller,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          // search();
                          start(city_name_controller.text);
                        },
                        icon: const Icon(Icons.search)),
                    hintText: "Search",
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)))),
              ),
            ),
            // Text(temp),

            state
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Gap(100),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                const Icon(Icons.location_on),
                                const Gap(10),
                                Text(name,
                                    style: const TextStyle(
                                        fontSize: 30, color: Colors.black)),
                              ],
                            ),
                          ),
                          Gap(MediaQuery.of(context).size.height / 12),
                          Column(
                            children: [
                              Text(
                                '${temp_value?.round()}°C',
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              const Gap(15),
                              // Center(
                              //     child: Text(
                              //         state.weather.weatherDescription!
                              //             .toUpperCase(),
                              //         style: const TextStyle(
                              //             fontSize: 25, color: Colors.white))),
                              const Gap(5),
                              Center(
                                  child: Text(
                                      DateFormat("EEEE , dd-MM-yyyy")
                                          .format(DateTime.now()),
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.white)))
                            ],
                          ),
                          Gap(MediaQuery.of(context).size.height / 7),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 15),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.sunny,
                                            color: Colors.yellow.shade700,
                                          ),
                                          const Gap(15),
                                          Column(
                                            children: [
                                              const Text("sunrise"),
                                              const Gap(10),
                                              Text(sunrise_time.toString())
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.dark_mode,
                                            color: Colors.grey.shade500,
                                          ),
                                          const Gap(15),
                                          Column(
                                            children: [
                                              const Text(
                                                "sunset",
                                              ),
                                              const Gap(10),
                                              Text(sunset_time.toString())
                                            ],
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                              const Divider(
                                thickness: 3,
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 15),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.thermostat,
                                            color: Colors.orange,
                                          ),
                                          const Gap(15),
                                          Column(
                                            children: [
                                              const Text("max temp"),
                                              const Gap(10),
                                              Text('${temp_max_C?.round()}°C')
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.thermostat,
                                            color: Colors.purple,
                                          ),
                                          const Gap(15),
                                          Column(
                                            children: [
                                              const Text("min temp"),
                                              const Gap(10),
                                              Text('${temp_min_C?.round()}°C')
                                            ],
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Container(),
                  )

            // FutureBuilder(
            //     future: start(),
            //     builder: (context, snap) {
            //       print(snap.connectionState);

            //       if (snap.connectionState == ConnectionState.done) {
            //         if (snap.hasData) {
            //           return Center(child: Text(.toString()));
            //         } else {
            //           return const Text("something went wrong");
            //         }
            //       } else if (snap.connectionState == ConnectionState.waiting) {
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       } else {
            //         return Container();
            //       }
            //     })
          ],
        ),
      ),
    );
  }
}
