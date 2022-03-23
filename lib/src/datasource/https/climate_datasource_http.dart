import 'dart:convert';

import 'package:previsao_tempo/src/datasource/interface/clima_datasource_interface.dart';
import 'package:http/http.dart' as http;

class ClimateDatasourceHttp extends IClimateDataSource {
  final http.Client client;
  ClimateDatasourceHttp(this.client);

  @override
  Future<Map<String, dynamic>> getClimate(String city) async {
    try {
      final uri = Uri.parse('https://goweather.herokuapp.com/weather/$city');
      final response = jsonDecode((await client.get(uri)).body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
