import 'package:previsao_tempo/src/datasource/https/climate_datasource_http.dart';
import 'package:previsao_tempo/src/datasource/uno/climate_datasource_uno.dart';
import 'package:previsao_tempo/src/model/climate_model.dart';

class ClimateRepository {
  final ClimateDatasourceUno dataSurce;

  ClimateRepository(this.dataSurce);
  Future<ClimateModel> getClimate(String city) async {
    try {
      Map<String, dynamic> result = await dataSurce.getClimate(city);
      final climate = ClimateModel.fromJson(result);
      return climate;
    } catch (e) {
      rethrow;
    }
  }
}
