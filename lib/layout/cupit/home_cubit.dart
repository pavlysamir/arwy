import 'package:arwyapp/moduels/home_screens/analysis_screen.dart';
import 'package:arwyapp/moduels/home_screens/camera_screen.dart';
import 'package:arwyapp/moduels/home_screens/crops_screen.dart';
import 'package:arwyapp/moduels/home_screens/notification_screen.dart';
import 'package:arwyapp/moduels/home_screens/settings_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  List<Widget> homeScreen = [
    CropsScreen(),
    AnalysisScreen(),
    NotificationScreen(),
    SettingsScreen()
  ];

  int currentscreen = 0;

  void changeSreens(int index){
    currentscreen = index ;
    emit(ChangeBottomBar());
  }

  bool isClickedOn = true;
  String onOrOff = '   ON';
  Color color = Colors.green;
  void ChangeColorContainer(){
    isClickedOn = !isClickedOn;
    if(isClickedOn){
      onOrOff = '   ON';
      color = Colors.green;
    }else{
      onOrOff = '   OFF';
      color = Colors.red;
    }

    emit(ChangeColorOfContainer());
  }

  bool switchbutton = true;
  Color colorOfSwtich= Colors.black;
  void ChangeColorOfSwich(){
    switchbutton = !switchbutton;
    switchbutton ? colorOfSwtich= Colors.black :colorOfSwtich= Colors.green;
    emit(ChangeColorOfSwitch());
  }

}
