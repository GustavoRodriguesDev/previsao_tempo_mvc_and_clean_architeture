import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:previsao_tempo/src/model/climate_model.dart';
import 'package:previsao_tempo/src/model/forecast_model.dart';
import 'package:previsao_tempo/src/repository/climate_repository.dart';
import 'package:previsao_tempo/src/view%20MVC/controller/home_controller.dart';

class ClimateRepositoryMock extends Mock implements ClimateRepository {}

void main() {
  late ClimateRepositoryMock repo;
  late HomeController controller;

  setUp(() {
    repo = ClimateRepositoryMock();
    controller = HomeController(repo);
  });

  test('Deve verificar se o controller está atribuindo valor a variavel clima quando for chmado ', () async {
    var result = ClimateModel(temperature: '15', wind: '1', description: 'vento', forecast: [
      ForecastModel(
        day: '1',
        temperature: '18',
        wind: '4',
      )
    ]);
    when(() => repo.getClimate('')).thenAnswer((_) async => result);
    await controller.getClimate();
    expect(controller.climate, isA<ClimateModel>());
  });
}
