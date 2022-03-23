import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:previsao_tempo/src/datasource/uno/climate_datasource_uno.dart';
import 'package:uno/uno.dart';

class UnoMock extends Mock implements Uno {}

class ResponseMock extends Mock implements Response {
  @override
  dynamic data;
  ResponseMock({required this.data});
}

void main() {
  late UnoMock uno;
  late ClimateDatasourceUno datasource;
  dynamic data = {
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
    uno = UnoMock();
    datasource = ClimateDatasourceUno(uno);
  });

  test('deve retornar uma <Future<Map<String, dynamic>>> quando o metodo getClimate for chamado', () async {
    when(() => uno.get(any())).thenAnswer((_) async => ResponseMock(data: data));
    final response = await datasource.getClimate('');
    expect(response, isA<Map<String, dynamic>>());
  });
}
