import 'package:flutter/material.dart';

class NoWeatherPage extends StatelessWidget {
  const NoWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
            'There is no Weather🥺Start Searching Now🕵🏻',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    ));
  }
}
