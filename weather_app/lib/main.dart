import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weatherCubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weatherStates.dart';
import 'package:weather_app/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          return Builder(builder: (context) {
            return MaterialApp(
              home: HomePage(),
              title: 'Weather App',
              // theme: ThemeData(
              //   primarySwatch: Colors.green,
              // ),
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weathermodel
                        ?.weatherStateName),
              ),
              debugShowCheckedModeBanner:
                  false, // Disable debug mode banner for better performance and security.
            );
          });
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? weatherStateName) {
  if (weatherStateName == null) {
    return Colors.blue; // Default fallback
  }

  // Normalize the input string
  final normalizedWeatherState = weatherStateName.trim().toLowerCase();

  switch (normalizedWeatherState) {
    // Sunny and clear weather
    case 'sunny':
    case 'clear':
      return Colors.orange;

    // Rainy weather
    case 'partly cloudy':
    case 'patchy rain possible':
    case 'light rain':
    case 'patchy light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
      return Colors.blue;

    // Foggy and misty weather
    case 'freezing fog':
    case 'fog':
    case 'overcast':
    case 'mist':
    case 'cloudy':
      return Colors.blueGrey;

    // Snowy and sleet weather
    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
    case 'blowing snow':
    case 'blizzard':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
      return Colors.cyan;

    // Thunderous weather
    case 'thundery outbreaks possible':
    case 'moderate or heavy snow with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy light rain with thunder':
      return Colors.deepPurple;

    // Default for unspecified weather states
    default:
      print("Warning: Unsupported weather state - $weatherStateName");
      return Colors.amber; // Default fallback
  }
}
