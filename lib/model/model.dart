import 'package:weatherapp/styles/string.dart';

class model {
  String? name;
  String? temp;
  String? description;
  String? sunrise;
  String? sunset;
  String? temp_max;
  String? temp_min;

  model(
      {this.name,
      this.description,
      this.temp_max,
      this.temp_min,
      this.sunrise,
      this.sunset,
      this.temp});

  model.fromMap(Map<String, dynamic> map) {
    name = map["name"];
    temp = map["temp"];
    description = map["description"];
    sunrise = map["sunrise"];
    sunset = map["sunset"];
    temp_min = map["temp_min"];
    temp_max = map["temp_max"];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name!,
      "temp": temp!,
      "description": description,
      "sunrise": sunrise,
      "sunset": sunset,
      "temp_min": temp_min,
      "temp_max": temp_max
    };
  }
}
