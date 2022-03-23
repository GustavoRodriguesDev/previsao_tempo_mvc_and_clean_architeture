import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:previsao_tempo/src/utils/const.dart';

import 'components/climate_day.dart';
import 'components/climate_next_days.dart';
import 'controller/home_controller.dart';

class HomepageMVC extends StatefulWidget {
  const HomepageMVC({Key? key}) : super(key: key);

  @override
  State<HomepageMVC> createState() => _HomepageState();
}

class _HomepageState extends State<HomepageMVC> {
  final HomeController controller = Modular.get<HomeController>();
  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {});
    });

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      controller.getClimate();
    });
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
                          onChanged: (value) => controller.citySearch(value),
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                controller.getClimate();
                              },
                              child: const Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        if (controller.climate == null)
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        if (controller.climate != null)
                          ClimateDay(
                            description: controller.climate!.description,
                            city: controller.city,
                            height: height * 0.64,
                            width: width,
                            temp: controller.climate!.temperature,
                            wind: controller.climate!.wind,
                            image: controller.selectImage(),
                          ),
                        if (controller.climate != null)
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
                                    forecast: controller.climate!.forecast,
                                    itemCount: controller.climate!.forecast.length,
                                  ),
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
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
