

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubits/weather_cubit.dart';
import 'package:weatherapp/Cubits/weather_state.dart';
import 'package:weatherapp/Helper/theme_color.dart';
import 'package:weatherapp/Views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<WeatherCubit>(context)
                      .weatherModel
                      ?.weatherStateName,
                ),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}