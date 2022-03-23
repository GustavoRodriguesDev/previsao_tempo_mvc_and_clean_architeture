import 'package:previsao_tempo/src/datasource/interface/clima_datasource_interface.dart';
import 'package:uno/uno.dart';

class ClimateDatasourceUno extends IClimateDataSource {
  final Uno uno;

  ClimateDatasourceUno(this.uno);

  @override
  Future<Map<String, dynamic>> getClimate(String city) async {
    try {
      final response = await uno.get('https://goweather.herokuapp.com/weather/$city');
      return response.data;
    } on UnoError catch (_) {
      rethrow;
    }
  }
}
