
class WeatherModel {
  final String city;
  final String updatedAt;
  final String image;
  final int temp;
  final int maxTemp;
  final int minTemp;
  final String weatherStateName;

  WeatherModel({
    required this.city,
    required this.updatedAt,
    required this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['location']['name'],
      updatedAt: json['current']['last_updated'],
      image: json['current']['condition']['icon'],
      temp: json['current']['temp_c'].toInt(),
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'].toInt(),
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'].toInt(),
      weatherStateName: json['current']['condition']['text'],
    );
  }
}