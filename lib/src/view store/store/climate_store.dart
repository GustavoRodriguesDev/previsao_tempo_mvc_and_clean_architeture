import 'package:flutter/cupertino.dart';
import 'package:previsao_tempo/src/model/climate_model.dart';
import 'package:previsao_tempo/src/repository/climate_repository.dart';
import 'package:previsao_tempo/src/utils/deboucer.dart';
import 'package:previsao_tempo/src/view%20store/state/climate_state.dart';

class ClimateStore extends ValueNotifier<ClimateState> {
  final ClimateRepository repository;
  ClimateModel? climate;
  String city = 'Nova Campina';
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  ClimateStore(this.repository) : super(InitialClimateState());

  Future featchClimate() async {
    value = LoadingClimateState();
    try {
      climate = await repository.getClimate(city);
      value = SuccessCLimateState(climate!);
    } catch (e) {
      value = ErrorClimateState(e.toString());
    }
  }

  void citySearch(String citySearch) {
    _debouncer.run(() async {
      city = citySearch;
    });
  }
}
