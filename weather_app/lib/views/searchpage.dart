import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weatherCubit.dart';
import 'package:weather_app/models/weather_model.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onSubmitted: (value) {
              BlocProvider.of<GetWeatherCubit>(context)
                  .getWeather(cityName: value);
              Navigator.pop(context);
            },
            cursorColor: Colors.green,
            decoration: const InputDecoration(
                
              
                hintText: 'Enter a City Name',
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                labelText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                suffixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 16,
                )),
          ),
        ),
      ),
    );
  }
}

WeatherModel? weathermodel;
