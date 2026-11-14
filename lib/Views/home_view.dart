
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubits/weather_cubit.dart';
import 'package:weatherapp/Cubits/weather_state.dart';
import 'package:weatherapp/Views/search_view.dart';
import 'package:weatherapp/Widgets/no_weatherbody.dart';
import 'package:weatherapp/Widgets/weather_info.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SearchView()),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(weatherModel: state.weatherModel);
          } else if (state is WeatherFailureState) {
            return Center(child: Text(state.errorMessage));
          }
          return const NoWeatherBody();
        },
      ),
    );
  }
}