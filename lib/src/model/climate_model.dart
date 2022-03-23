import 'package:previsao_tempo/src/model/forecast_model.dart';

class ClimateModel {
  final String temperature;
  final String wind;
  final String description;
  final List<ForecastModel> forecast;

  ClimateModel({
    required this.temperature,
    required this.wind,
    required this.description,
    required this.forecast,
  });

  static ClimateModel fromJson(json) {
    return ClimateModel(
        temperature: json['temperature'] ?? '',
        wind: json['wind'] ?? '',
        description: json['description'] ?? '',
        forecast: (json['forecast'] as List).map((e) => ForecastModel.fromJson(e)).toList());
  }

  @override
  String toString() {
    return '$temperature | $description | $wind | $forecast';
  }
}
