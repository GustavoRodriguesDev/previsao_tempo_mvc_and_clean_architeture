import 'package:flutter/cupertino.dart';
import 'package:previsao_tempo/src/model/climate_model.dart';
import 'package:previsao_tempo/src/model/forecast_model.dart';
import 'package:previsao_tempo/src/repository/climate_repository.dart';
import 'package:previsao_tempo/src/utils/deboucer.dart';

class HomeController extends ChangeNotifier {
  ClimateRepository data;
  ClimateModel? climate;
  List<ForecastModel>? forecast;

  String city = 'maringa';
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  HomeController(this.data);

  Future<void> getClimate() async {
    climate = await data.getClimate(city);
    forecast = climate!.forecast;
    notifyListeners();
  }

  void citySearch(String citySearch) {
    _debouncer.run(() async {
      city = citySearch;
    });
  }

  String selectImage() {
    if (climate!.description == 'Light rain') {
      return 'assets/climate/Light_rain_shower.png';
    } else if (climate!.description == 'Light rain shower' || climate!.description == 'Light drizzle') {
      return 'assets/climate/Light_rain_shower.png';
    } else if (climate!.description == 'Sunny' || climate!.description == 'Clear') {
      return 'assets/climate/sunny.png';
    } else if (climate!.description == 'Partly cloudy') {
      return 'assets/climate/partly_cloudy.png';
    } else if (climate!.description == 'Patchy rain possible') {
      return 'assets/climate/patchy_rain_possible_climate.png';
    } else if (climate!.description == 'Rain') {
      return 'assets/climate/rain.png';
    }
    return '';
  }
}
