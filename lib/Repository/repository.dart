import 'package:flutter/material.dart';
import 'package:weathertest/Api/networking.dart';
import '../Models/day_details.dart';
import '../Models/weather_response.dart';




class WeatherRepository {
  final ApiClient apiClient;

  WeatherRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<List<DayWeatherDetails>> getData() async {
    var response = await apiClient.callRequest();
    print("Here:" + WeatherResponse.fromJson(response).list.toString());
    return WeatherResponse.fromJson(response).list;
  }
}