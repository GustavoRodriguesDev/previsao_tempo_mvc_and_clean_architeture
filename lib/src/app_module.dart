import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:previsao_tempo/src/datasource/dio/climate_datasource_dio.dart';
import 'package:previsao_tempo/src/datasource/https/climate_datasource_http.dart';
import 'package:previsao_tempo/src/datasource/uno/climate_datasource_uno.dart';
import 'package:previsao_tempo/src/repository/climate_repository.dart';
import 'package:previsao_tempo/src/view%20store/store/climate_store.dart';
import 'package:previsao_tempo/src/view%20store/view_store.dart';

import 'package:uno/uno.dart';
import 'package:http/http.dart' as http;

import 'view MVC/controller/home_controller.dart';
import 'view MVC/homepage.com.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomeController(i())),
        Bind.factory((i) => ClimateRepository(i())),
        Bind.factory((i) => ClimateDataSourceDio(i())),
        Bind.factory((i) => ClimateDatasourceUno(i())),
        Bind.factory((i) => ClimateDatasourceHttp(i())),
        Bind.singleton((i) => Uno()),
        Bind.singleton((i) => http.Client()),
        Bind.singleton((i) => Dio()),
        Bind.factory((i) => ClimateStore(i())),
      ];
  @override
  List<ModularRoute> get routes => [ChildRoute('/', child: (constex, args) => const HomePageStore())];
}
