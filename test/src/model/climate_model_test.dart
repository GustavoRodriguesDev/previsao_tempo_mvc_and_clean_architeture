import 'package:flutter_test/flutter_test.dart';
import 'package:previsao_tempo/src/model/climate_model.dart';

void main() {
  Map<String, dynamic> data = {
    "temperature": "18 °C",
    "wind": "6 km/h",
    "description": "Partly cloudy",
    "forecast": [
      {"day": "1", "temperature": "18 °C", "wind": "14 km/h"},
      {"day": "2", "temperature": " °C", "wind": " km/h"},
      {"day": "3", "temperature": "3 °C", "wind": " km/h"}
    ]
  };
  test('', () {
    final result = ClimateModel.fromJson(data);
    expect(result, isA<ClimateModel>());
  });
}
