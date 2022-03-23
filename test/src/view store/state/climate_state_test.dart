import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:previsao_tempo/src/model/climate_model.dart';
import 'package:previsao_tempo/src/view%20store/state/climate_state.dart';
import 'package:previsao_tempo/src/view%20store/store/climate_store.dart';

import '../../controller/climate_controller_test.dart';

void main() async {
  late ClimateRepositoryMock repo;
  late ClimateStore store;

  setUp(() {
    repo = ClimateRepositoryMock();
    store = ClimateStore(repo);
  });
  test('Deve Retornar o estado de erro quando for chmado o metodo featchClimate', () async {
    ClimateModel climateModel = ClimateModel(temperature: '19', wind: '15', description: 'description', forecast: []);
    when(() => store.featchClimate()).thenAnswer((_) async => climateModel);
    await store.featchClimate();
    expect(store.value, isA<SuccessCLimateState>());
  });

  test('Deve retornar um erro quando o metodo featchClimate for chamado', () {
    when(() => store.featchClimate()).thenThrow(Exception());

    expect(store.value, isA<ErrorClimateState>());
  });
}
