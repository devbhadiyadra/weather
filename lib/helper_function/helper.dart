import 'package:intl/intl.dart';

class helper {
  helper();

  static double fahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 273.15);
  }

  static String? getDate(int sunValue) {
    int millisecondsSinceEpoch = sunValue * 1000;

    DateTime sunrise_time =
        DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);

    // Print the formatted date and time
    String sunrise_time_format = DateFormat().add_jm().format(sunrise_time);
    return sunrise_time_format;
  }
}
