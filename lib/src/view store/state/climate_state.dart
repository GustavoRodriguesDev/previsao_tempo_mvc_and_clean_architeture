import 'package:previsao_tempo/src/model/climate_model.dart';
import 'package:previsao_tempo/src/model/forecast_model.dart';

abstract class ClimateState {}

class InitialClimateState extends ClimateState {}

class LoadingClimateState extends ClimateState {}

class SuccessCLimateState extends ClimateState {
  ClimateModel climate;

  SuccessCLimateState(this.climate);

  String get decription => climate.description;
  String get wind => climate.wind;
  String get temperature => climate.temperature;
  List<ForecastModel> get forecast => climate.forecast;

  String selectImage() {
    if (climate.description == 'Light rain') {
      return 'assets/climate/Light_rain_shower.png';
    } else if (climate.description == 'Light rain shower' || climate.description == 'Light drizzle') {
      return 'assets/climate/Light_rain_shower.png';
    } else if (climate.description == 'Sunny' || climate.description == 'Clear') {
      return 'assets/climate/sunny.png';
    } else if (climate.description == 'Partly cloudy') {
      return 'assets/climate/partly_cloudy.png';
    } else if (climate.description == 'Patchy rain possible') {
      return 'assets/climate/patchy_rain_possible_climate.png';
    } else if (climate.description == 'Rain') {
      return 'assets/climate/rain.png';
    }
    return '';
  }
}

class ErrorClimateState extends ClimateState {
  final String messageError;

  ErrorClimateState(this.messageError);
}
