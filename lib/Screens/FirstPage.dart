import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathertest/Screens/SecondPage.dart';
import 'package:weathertest/Widget/header_widget.dart';
import 'package:weathertest/Widget/loading_widget.dart';
import 'package:weathertest/Widget/weather_cards.dart';
import 'package:weathertest/bloc/weather_bloc.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WeatherBloc>(context).add(WeatherRequested());
    return Scaffold(
      backgroundColor: Colors.grey[900],
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.6, 0.8, 1.0],
            colors: [
              Colors.red[900],
              Colors.red,
              Colors.redAccent,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(flex: 20, child: HeaderWidget()),
            Expanded(
              flex: 10,
              child: RefreshIndicator(
                onRefresh: () {
                  BlocProvider.of<WeatherBloc>(context).add(
                    WeatherRefreshRequested(),
                  );
                  return _refreshCompleter.future;
                },
                child: Center(
                  child: BlocConsumer<WeatherBloc, WeatherState>(
                    listener: (context, state) {
                      print("listener state $state");
                      if (state is WeatherLoadSuccess) {
                        _refreshCompleter?.complete();
                        _refreshCompleter = Completer();
                      } else if (state is WeatherDetailsState) {
                        Timer(Duration(milliseconds: 500), () {
                          print("Timer");
                          BlocProvider.of<WeatherBloc>(context).add(
                            WeatherRefreshRequested(),
                          );
                        });
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WeatherDetailsWidget(),
                                settings: RouteSettings(arguments: state.data)),
                          );
                        });
                      }
                    },
                    builder: (context, state) {
                      if (state is WeatherLoadInProgress) {
                        return Center(
                            child: LoadingWidget(
                              message: 'loading...',
                            ));
                      } else if (state is WeatherLoadSuccess) {
                        final weather = state.dayWeathersResponse;
                        // to hide the loader
                        _refreshCompleter?.complete();
                        _refreshCompleter = Completer();
                        return ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: weather.length,
                          itemBuilder: (context, index) {
                            return WeatherCard(weather[index]);
                          },
                        );
                      } else if (state is WeatherLoadFailure) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton.icon(
                              color: Colors.transparent,
                              label: Text(
                                'Opps , Something went wrong try again please',
                                style: TextStyle(color: Colors.white),
                              ),
                              icon: Icon(Icons.cached_rounded,
                                  color: Colors.white),
                              onPressed: () {
                                BlocProvider.of<WeatherBloc>(context)
                                    .add(WeatherRequested());
                              },
                            ),
                          ],
                        );
                      } else {
                        return Center();
                      }
                    },
                  ),
                ),
              ),
            ),
          Spacer()],
        ),
      ),
    );
  }
}
