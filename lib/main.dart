import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:previsao_tempo/src/app_module.dart';
import 'package:previsao_tempo/src/appwidget.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
