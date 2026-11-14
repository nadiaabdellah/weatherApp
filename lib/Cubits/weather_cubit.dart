
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubits/weather_state.dart';
import 'package:weatherapp/Models/weather_model.dart';
import 'package:weatherapp/Services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(NoWeatherState());

  WeatherModel? weatherModel;

  Future<void> getWeather({required String city}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel = await WeatherService(Dio()).getCurrentWeather(city: city);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(
        errorMessage: e.toString().replaceFirst('Exception: ', ''),
      ));
    }
  }
}