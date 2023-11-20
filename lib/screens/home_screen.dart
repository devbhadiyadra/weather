import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/data/my_data.dart';

class home_screen extends StatefulWidget {
  String? city;
  home_screen({super.key, this.city});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  TextEditingController city_name_controller = TextEditingController();

  setCity() {
    setState(() {
      widget.city = city_name_controller.text;
    });
  }

  search() async {
    WeatherFactory wf = WeatherFactory(API_KEY);
    Weather weather =
        await wf.currentWeatherByCityName(city_name_controller.text);

    Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${weather.latitude}&lon=${weather.longitude}&appid=ce1463449767f059b255fa59d6345b70"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // print(data.toString());
      final name = data['name'];

      // print('name ${name}');

      print(response.body.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(1, 0),
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.blue.shade300, shape: BoxShape.circle),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1, 0),
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
              child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return const Center(
                      child: Text(
                        "Fetching your location...",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );
                  } else if (state is WeatherSuccess) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(20),
                          TextField(
                            controller: city_name_controller,
                            decoration: InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      search();
                                    },
                                    icon: const Icon(Icons.search)),
                                hintText: "Search",
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)))),
                          ),
                          const Gap(20),
                          Row(
                            children: [
                              const Icon(Icons.location_on),
                              const Gap(10),
                              Text('${state.weather.areaName}',
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.black)),
                            ],
                          ),
                          Gap(MediaQuery.of(context).size.height / 12),
                          Column(
                            children: [
                              Text(
                                '${state.weather.temperature!.celsius!.round()}°C',
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              const Gap(15),
                              Center(
                                  child: Text(
                                      state.weather.weatherDescription!
                                          .toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 25, color: Colors.white))),
                              const Gap(5),
                              Center(
                                  child: Text(
                                      DateFormat("EEEE , dd-MM-yyyy")
                                          .format(state.weather.date!),
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
                                              Text(DateFormat().add_jm().format(
                                                  state.weather.sunrise!))
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
                                              Text(DateFormat().add_jm().format(
                                                  state.weather.sunset!))
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
                                              Text(
                                                  '${state.weather.tempMax!.celsius!.round().toString()}°C')
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
                                              Text(
                                                  '${state.weather.tempMin!.celsius!.round().toString()}°C')
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
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
