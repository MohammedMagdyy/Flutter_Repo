import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weatherCubit.dart';
import 'package:weather_app/main.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var weather_model = BlocProvider.of<GetWeatherCubit>(context).weathermodel!;

    // if (!weather_model.image.contains("https:")) {
    //   weather_model.image = "https:{$weather_model.image}";
    // }

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          getThemeColor(
            weather_model.weatherStateName,
          ),
          getThemeColor(weather_model.weatherStateName)[300]!,
          getThemeColor(weather_model.weatherStateName)[50]!,
        ],
        // [Colors.orange,Colors.green],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      weather_model.cityName,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Updated at:${weather_model.date.hour.round()}:${weather_model.date.minute.round()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          image: NetworkImage("https:${weather_model.image}"),
                        ),
                        Text(weather_model.temp.round().toString(),
                            style: const TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                            )),
                        Column(children: [
                          Text(
                              'Max Temp:${weather_model.maxTemp.round().toString()}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                              'Min Temp: ${weather_model.minTemp.round().toString()}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                        ])
                      ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  weather_model.weatherStateName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]),
        ),
      ),
    ));
  }
}
