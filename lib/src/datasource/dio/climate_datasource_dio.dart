import 'package:dio/dio.dart';
import 'package:previsao_tempo/src/datasource/interface/clima_datasource_interface.dart';

class ClimateDataSourceDio extends IClimateDataSource {
  final Dio dio;

  ClimateDataSourceDio(this.dio);

  @override
  Future<Map<String, dynamic>> getClimate(String city) async {
    try {
      final response = await dio.get('https://goweather.herokuapp.com/weather/$city');
      return response.data;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
