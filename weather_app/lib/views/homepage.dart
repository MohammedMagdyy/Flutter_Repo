import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weatherCubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weatherStates.dart';

import 'package:weather_app/views/noweatherpage.dart';
import 'package:weather_app/views/searchpage.dart';
import 'package:weather_app/views/weatherpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.orange,
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return const Searchpage();
                }),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, State) {
          if (State is NoWeatherState) {
            return NoWeatherPage();
          } else if (State is WeatherLoadedState) {
            return WeatherPage();
          } else {
            return const Center(child: Text("ooops there might be a problem"));
          }
        },
      ),
    );
  }
}
