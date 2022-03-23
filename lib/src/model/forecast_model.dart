class ForecastModel {
  final String day;
  final String temperature;
  final String wind;

  ForecastModel({required this.day, required this.temperature, required this.wind});

  static ForecastModel fromJson(json) {
    return ForecastModel(
      day: json['day'] ?? '',
      temperature: json['temperature'] ?? '',
      wind: json['wind'] ?? '',
    );
  }
}
