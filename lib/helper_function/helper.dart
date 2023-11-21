import 'package:flutter/material.dart';
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

  static Widget getCode(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset(
          "assets/images/1.png",
          height: 100,
          width: 100,
        );

      case >= 300 && < 400:
        return Image.asset(
          "assets/images/2.png",
          height: 100,
          width: 100,
        );

      case >= 500 && < 600:
        return Image.asset(
          "assets/images/3.png",
          height: 100,
          width: 100,
        );

      case >= 600 && < 700:
        return Image.asset(
          "assets/images/4.png",
          height: 100,
          width: 100,
        );

      case >= 700 && < 800:
        return Image.asset(
          "assets/images/5.png",
          height: 100,
          width: 100,
        );

      case == 800:
        return Image.asset(
          "assets/images/6.png",
          height: 100,
          width: 100,
        );

      case >= 800 && < 804:
        return Image.asset(
          "assets/images/7.png",
          height: 100,
          width: 100,
        );

      default:
        return Image.asset(
          "assets/images/7.png",
          height: 100,
          width: 100,
        );
    }
  }
}
