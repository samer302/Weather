

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathertest/Models/day_details.dart';
import 'package:weathertest/Repository/repository.dart';

/// start weather event
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRequested extends WeatherEvent {
  @override
  List<Object> get props => [];
}

class WeatherRefreshRequested extends WeatherEvent {

  @override
  List<Object> get props => [];
}

class MoveToDetailsEvent extends WeatherEvent {
  final DayWeatherDetails data;
  const MoveToDetailsEvent({@required this.data})
      : assert(data != null);
  @override
  List<Object> get props => [data];
}

/// end weather event

/// start Weather State
abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherDetailsState extends WeatherState {
  final DayWeatherDetails data;
  const WeatherDetailsState({@required this.data})
      : assert(data != null);
}

class WeatherLoadSuccess extends WeatherState {
  final List<DayWeatherDetails> dayWeathersResponse;

  const WeatherLoadSuccess({@required this.dayWeathersResponse})
      : assert(dayWeathersResponse != null);

  @override
  List<Object> get props => [dayWeathersResponse];
}

class WeatherLoadFailure extends WeatherState {}

/// End Weather State

/// start Weather bloc
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if(event is MoveToDetailsEvent){
      print("mapEventToState event is  MoveToDetailsEvent");
      yield WeatherDetailsState(data: event.data);
    }
    else if (event is WeatherRequested) {
      yield* _mapWeatherRequestedToState(event);
    } else if (event is WeatherRefreshRequested) {
      yield* _mapWeatherRefreshRequestedToState(event);
    }
  }

  Stream<WeatherState> _mapWeatherRequestedToState(
      WeatherRequested event,
      ) async* {
    yield WeatherLoadInProgress();
    try {
      final List<DayWeatherDetails> dayWeathers =
      await weatherRepository.getData();
      print('dayWeathers length ${dayWeathers.length} ');
      print('dayWeathers reversed ${dayWeathers.reversed} ');
      yield WeatherLoadSuccess(dayWeathersResponse: dayWeathers);
    } catch (_) {
      yield WeatherLoadFailure();
    }
  }

  Stream<WeatherState> _mapWeatherRefreshRequestedToState(
      WeatherRefreshRequested event,
      ) async* {
    try {
      final List<DayWeatherDetails> dayWeathers =
      await weatherRepository.getData();
      yield WeatherLoadSuccess(dayWeathersResponse: dayWeathers);
    } catch (_) {}
  }




}

