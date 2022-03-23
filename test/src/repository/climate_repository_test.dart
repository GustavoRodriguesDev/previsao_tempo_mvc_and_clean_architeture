import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:previsao_tempo/src/datasource/https/climate_datasource_http.dart';
import 'package:previsao_tempo/src/datasource/uno/climate_datasource_uno.dart';
import 'package:previsao_tempo/src/model/climate_model.dart';
import 'package:previsao_tempo/src/repository/climate_repository.dart';

class ClimateDataSurceMock extends Mock implements ClimateDatasourceUno {}

void main() {
  late ClimateDataSurceMock data;
  late ClimateRepository repo;
  Map<String, dynamic> valueMock = {
    "temperature": "18 °C",
    "wind": "6 km/h",
    "description": "Partly cloudy",
    "forecast": [
      {"day": "1", "temperature": "18 °C", "wind": "14 km/h"},
      {"day": "2", "temperature": " °C", "wind": " km/h"},
      {"day": "3", "temperature": "3 °C", "wind": " km/h"}
    ]
  };
  setUp(() {
    data = ClimateDataSurceMock();
    repo = ClimateRepository(data);
  });
  test('Deve retornar um response de ClimateModel, Quando o DataSource for chamado pelo Repository', () async {
    when(() => data.getClimate('')).thenAnswer((_) async => valueMock);
    final response = await repo.getClimate('');
    expect(response, isA<ClimateModel>());
  });
}
