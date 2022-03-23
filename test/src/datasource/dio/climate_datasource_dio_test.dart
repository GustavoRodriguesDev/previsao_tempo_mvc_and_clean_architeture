import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:previsao_tempo/src/datasource/dio/climate_datasource_dio.dart';

class DioMock extends Mock implements Dio {}

class RequestOptionsMOck extends Mock implements RequestOptions {}

void main() async {
  late DioMock dioMock;
  late ClimateDataSourceDio dataSource;
  late RequestOptionsMOck requestOptionsMOck;
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
    dioMock = DioMock();
    dataSource = ClimateDataSourceDio(dioMock);
    requestOptionsMOck = RequestOptionsMOck();
  });

  test('deve retornar um response.data quando o Dio for chamado', () async {
    when(() => dioMock.get(any())).thenAnswer(
      (_) async => Response(requestOptions: requestOptionsMOck, data: data),
    );
    final result = await dataSource.getClimate('');
    expect(result, isA<Map<String, dynamic>>());
  });
}
