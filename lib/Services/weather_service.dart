
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weatherapp/Models/weather_model.dart';

class WeatherService {
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'a20e73fb445b4e25b0f211036260811';
  final Dio dio;

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      final response = await dio.get(
        '$baseUrl/forecast.json',
        queryParameters: {'key': apiKey, 'q': city, 'days': 1},
      );
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      final String errMsg = e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      throw Exception(errMsg);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try later');
    }
  }
}