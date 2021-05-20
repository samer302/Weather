import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathertest/Api/networking.dart';
import 'package:weathertest/Screens/FirstPage.dart';

import 'Repository/repository.dart';
import 'bloc/bloc.dart';
import 'bloc/weather_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final WeatherRepository weatherRepository =
  WeatherRepository(apiClient: ApiClient(httpClient: Client()));
  runApp(MyApp(weatherRepository: weatherRepository));
}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;
  MyApp({@required this.weatherRepository});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> WeatherBloc(weatherRepository: weatherRepository),
      child: MaterialApp(
        home: FirstPage(),
      ),
    );
  }
}

