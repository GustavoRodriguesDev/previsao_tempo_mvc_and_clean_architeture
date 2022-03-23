import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:previsao_tempo/src/utils/const.dart';
import 'package:previsao_tempo/src/view%20MVC/components/climate_day.dart';
import 'package:previsao_tempo/src/view%20MVC/components/climate_next_days.dart';
import 'package:previsao_tempo/src/view%20store/state/climate_state.dart';
import 'package:previsao_tempo/src/view%20store/store/climate_store.dart';

class HomePageStore extends StatefulWidget {
  const HomePageStore({Key? key}) : super(key: key);

  @override
  State<HomePageStore> createState() => _HomePageStoreState();
}

class _HomePageStoreState extends State<HomePageStore> {
  final ClimateStore store = Modular.get<ClimateStore>();

  @override
  void initState() {
    super.initState();
    store.featchClimate();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width,
                height: height,
                alignment: Alignment.topCenter,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      color: const Color(0xFF81B9DD),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextField(
                          onChanged: (value) => store.citySearch(value),
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                store.featchClimate();
                              },
                              child: const Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: store,
                      builder: (contex, state, child) {
                        if (state is LoadingClimateState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is ErrorClimateState) {
                          return Center(
                            child: Text(state.messageError),
                          );
                        }
                        if (state is SuccessCLimateState) {
                          return Column(
                            children: [
                              ClimateDay(
                                description: state.decription,
                                city: store.city,
                                height: height * 0.64,
                                width: width,
                                temp: state.temperature,
                                wind: state.wind,
                                image: state.selectImage(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Container(
                                  height: height * 0.19,
                                  width: width,
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text('Day:', style: textStyle),
                                          SizedBox(height: 6),
                                          Text('Temperature:', style: textStyle),
                                          SizedBox(height: 6),
                                          Text('Wind:', style: textStyle),
                                        ],
                                      ),
                                      SizedBox(width: width * 0.05),
                                      ClimateNextDays(
                                        width: width,
                                        forecast: state.forecast,
                                        itemCount: state.forecast.length,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        }
                        return Container();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
