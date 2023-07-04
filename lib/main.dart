import 'package:arwyapp/layout/cupit/home_cubit.dart';
import 'package:arwyapp/network/local/cashe_helper.dart';
import 'package:arwyapp/shared/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/SplashScreen/splash_screen.dart';
import 'shared/style/themedata.dart';

void main() async {
  //هنخزن فى cashhelperالuıd لليوزر الى عمل login
  //وعمله getهنا

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  CasheHelper.init();
  uId = CasheHelper.getData(key: 'uId');
  runApp(MyApp(uId));
}

class MyApp extends StatelessWidget {
  String? uId;
  MyApp(
    this.uId,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..readDataOnDb('test/temperature')
        ..readDataOnDb('test/humidity')
        ..readDataOnDb('test/WaterFlow'),
      //..readDataOndb('test'),  // الtagsاضيف باقى

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: LightTheme,
        home: openScreen(),
      ),
    );
  }

  Widget openScreen() {
    if (uId != null) {
      return SplashScreen(loginIn: true); //SplashScreen(loginIn: true);
    } else {
      return SplashScreen(loginIn: false); //SplashScreen(loginIn: false);
    }
  }
}
