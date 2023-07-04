import 'dart:ffi';

import 'package:arwyapp/models/messeges_model.dart';
import 'package:arwyapp/moduels/home_screens/analysis_screen.dart';
import 'package:arwyapp/moduels/home_screens/camera_screen.dart';
import 'package:arwyapp/moduels/home_screens/crops_screen.dart';
import 'package:arwyapp/moduels/home_screens/notification_screen.dart';
import 'package:arwyapp/moduels/home_screens/settings_screen.dart';
import 'package:arwyapp/shared/constant.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  static HomeCubit get(context) => BlocProvider.of(context);
  int auto = 1;
  var weather;
  var soilTemp;
  var humidity;
  var soilMoisture;
  var waterFlow;
  var soilAcidity;


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

  void writeDataOnDb({required auto})async{
    DatabaseReference ref = FirebaseDatabase.instance.ref("test");

    await ref.update({
     'Autonomy' : auto
    }).then((value) {
      emit(writeondatasuccsses());
      print('yarrb');
    }).catchError((error){
      emit(writeondataerror(error));
      print(error.toString());
    });
  }


  void readDataOnDb(String tag)async {
    DatabaseReference ref =
    FirebaseDatabase.instance.ref(tag);
    ref.onValue.listen((DatabaseEvent event) {
      if(tag == 'test/WaterFlow'){
        waterFlow = event.snapshot.value ;
        emit(readOnDataSuccess());
      } else if(tag == 'test/humidity'){
        humidity = event.snapshot.value;
        emit(readOnDataSuccess());
      }else if(tag == 'test/moisture'){
        soilMoisture = event.snapshot.value ;
        emit(readOnDataSuccess());
      }else if(tag == 'test/humidity'){
        humidity = event.snapshot.value ;
        emit(readOnDataSuccess());
      }else if(tag == 'test/temperature'){
        weather = event.snapshot.value ;
        emit(readOnDataSuccess());
      }
    });
  }

  void sendMessage({
    required String recieverId,
    required String dateTime,
    required String text,
}){
    MessageModel messageModel =MessageModel(
      senderId: uId,
      recieverId: recieverId,
      dateTime: dateTime,
      text: text
    );

    // set my chats
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(recieverId)
        .collection('messanges')
        .add(messageModel.toMap())
        .then((value) {
          emit(sendMessagesSuccess());
    })
        .catchError((error){
          emit(sendMessagesError(error));
    });


    //set receive chats
    FirebaseFirestore.instance
        .collection('users')
        .doc(recieverId)
        .collection('chats')
        .doc(uId)
        .collection('messanges')
        .add(messageModel.toMap())
        .then((value) {
          emit(sendMessagesSuccess());
    })
        .catchError((error){
          emit(sendMessagesError(error));
    });
}




  void signOut ()async{
    await FirebaseAuth.instance.signOut();
  }

}
