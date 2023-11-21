import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/styles/string.dart';

class model {
  String? location;
  String? name;
  double? temp;
  String? description;
  int? sunrise;
  int? sunset;
  double? temp_max;
  double? temp_min;

  model({this.location}) {
    location = this.location;
  }

  Future<void> getData() async {
    Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=ce1463449767f059b255fa59d6345b70"));
    // print(response.statusCode);
    final data = jsonDecode(response.body);
    // print(data);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      String getName = data['name'];

      // List<Map> weather = data['weather'];

      // Map getWeatherDesc = weather['description'];

      Map sys = data['sys'];
      int getSunrise = sys['sunrise'];
      int getSunset = sys['sunset'];

      Map main = data['main'];

      double getTemp = main['temp'];
      double getMintemp = main['temp_min'];
      double getMaxtemp = main['temp_max'];

      name = getName;
      temp = getTemp;
      // description = getWeatherDesc;
      sunrise = getSunrise;
      sunset = getSunset;
      temp_min = getMintemp;
      temp_max = getMaxtemp;

      // print(response.body.toString());
    } else {
      print(response.statusCode);
    }
  }

  // model.fromMap(Map<String, dynamic> map) {
  //   name = map["name"];
  //   temp = map["temp"];
  //   description = map["description"];
  //   sunrise = map["sunrise"];
  //   sunset = map["sunset"];
  //   temp_min = map["temp_min"];
  //   temp_max = map["temp_max"];
  // }

  // Map<String, dynamic> toMap() {
  //   return {
  //     "name": name!,
  //     "temp": temp!,
  //     "description": description,
  //     "sunrise": sunrise,
  //     "sunset": sunset,
  //     "temp_min": temp_min,
  //     "temp_max": temp_max
  //   };
  // }
}
