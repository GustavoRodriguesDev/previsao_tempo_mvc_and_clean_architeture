import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:previsao_tempo/src/datasource/https/climate_datasource_http.dart';
import 'package:http/http.dart' as http;

class ClientMock extends Mock implements http.Client {}

class ResponseMock extends Mock implements Response {
  @override
  final body;

  ResponseMock({this.body = ''});
}

void main() {
  final responseMock = ResponseMock();
  late http.Client client;
  late ClimateDatasourceHttp datasource;
  final url = Uri.parse('');

  setUpAll(() {
    client = ClientMock();
    datasource = ClimateDatasourceHttp(client);
    registerFallbackValue(url);
  });

  dynamic data = '''{
    "temperature": "18 °C",
    "wind": "6 km/h",
    "description": "Partly cloudy",
    "forecast": [
      {"day": "1", "temperature": "18 °C", "wind": "14 km/h"},
      {"day": "2", "temperature": " °C", "wind": " km/h"},
      {"day": "3", "temperature": "3 °C", "wind": " km/h"}
    ]
  }''';

  test('deve retornar um <Map<String, dynamic>> quando o metodo getClimate for chamado', () async {
    when(() => client.get(any())).thenAnswer((_) async => ResponseMock(body: data));

    final response = await datasource.getClimate('');
    expect(response, isA<Map<String, dynamic>>());
  });
}
