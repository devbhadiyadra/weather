part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class fetchWeather extends WeatherEvent {
  final Position position;
  // final String city_name;
  fetchWeather(this.position);
  List<Object> get props => [position];
}

class fetchWeathercity extends WeatherEvent {
  final String cityName;
  // final String city_name;
  fetchWeathercity(this.cityName);
  List<Object> get props => [cityName];
}
