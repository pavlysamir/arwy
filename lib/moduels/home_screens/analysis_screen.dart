import 'package:arwyapp/layout/cupit/home_cubit.dart';
import 'package:arwyapp/shared/components/Components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_icons/weather_icons.dart';

class AnalysisScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 64, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('System Stats',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    containerOfstats(
                        degree: '24',
                        icon: BoxedIcon(WeatherIcons.day_sunny, size: 16,),
                        iconName: 'Weather'
                    ),
                    SizedBox(width: 15,),
                    containerOfstats(
                        degree: '24',
                        icon: BoxedIcon(WeatherIcons.thermometer, size: 16,),
                        iconName: 'Soil temp'
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      progressIndecator(
                          degree: '20',
                          valueOfIndecator: 0.2,
                          color: Colors.blue,
                          icon: BoxedIcon(WeatherIcons.humidity, size: 14,),
                          iconName: 'Humidity'
                      ),
                      Spacer(),
                      progressIndecator(
                          degree: '50',
                          valueOfIndecator: 0.5,
                          color: Colors.red,
                          icon: BoxedIcon(WeatherIcons.thermometer, size: 14,),
                          iconName: 'Soil Moisture'
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      progressIndecator(
                          degree: '20',
                          valueOfIndecator: 0.2,
                          color: Colors.green,
                          icon: BoxedIcon(WeatherIcons.flood, size: 14,),
                          iconName: 'Water Flow'
                      ),
                      Spacer(),
                      progressIndecator(
                          degree: '50',
                          valueOfIndecator: 0.5,
                          color: Colors.blue,
                          icon: BoxedIcon(WeatherIcons.wind, size: 14,),
                          iconName: 'Soil acidity'
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 112,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: HomeCubit.get(context).color,
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(16),
                          topEnd: Radius.circular(16),
                          bottomEnd: Radius.circular(16),
                          bottomStart: Radius.circular(16)
                      )
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Watering System',
                              style: TextStyle(fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text('is',
                                  style: TextStyle(fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),),
                                Text(HomeCubit.get(context).onOrOff,
                                  style: TextStyle(fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),),
                              ],
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FloatingActionButton(onPressed: () {
                          HomeCubit.get(context).ChangeColorContainer();
                        },
                          child: Icon(
                            Icons.power_settings_new,
                            color: HomeCubit.get(context).color,),
                             backgroundColor: Colors.white,

                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
