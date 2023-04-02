import 'package:arwyapp/layout/cupit/home_cubit.dart';
import 'package:arwyapp/moduels/home_screens/camera_screen.dart';
import 'package:arwyapp/shared/components/Components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HomeCubit(),
  child: BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {},
  builder: (context, state) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: (){
          NavigateTo(context, CameraScreen());
        },
        child: Icon(Icons.camera_alt, size: 40 ,color: Colors.black54,),
      ),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     bottomNavigationBar: BottomAppBar(
       notchMargin: 8,
         shape: CircularNotchedRectangle(),
       clipBehavior: Clip.antiAlias,
       child:  BottomNavigationBar(
         elevation: 0.0,
         items: [
           BottomNavigationBarItem(icon: Icon( Icons.home), label: 'home',
               activeIcon: Column(children: [
                 Icon( Icons.home ),
                 Container(
                   height: 3,
                   width: 23,
                   color: Colors.green,
                 )
               ],)
           ),
           BottomNavigationBarItem(icon: Icon( Icons.analytics),label: 'analysis',
               activeIcon: Column(children: [
             Icon( Icons.analytics ),
             Container(
               height: 3,
               width: 23,
               color: Colors.green,
             )
           ],)),
           BottomNavigationBarItem(icon: Icon( Icons.notifications),label: 'notification',activeIcon: Column(children: [
             Icon( Icons.notifications ),
             Container(
               height: 3,
               width: 23,
               color: Colors.green,
             )
           ])),
           BottomNavigationBarItem(icon: Icon( Icons.settings),label: 'setting',activeIcon: Column(children: [
             Icon( Icons.settings ),
             Container(
               height: 3,
               width: 23,
               color: Colors.green,
             )
           ])),
         ],
         type: BottomNavigationBarType.fixed,
         currentIndex: HomeCubit.get(context).currentscreen,
         onTap: (index){
           HomeCubit.get(context).changeSreens(index);
         },
       ),
     ),
      body: HomeCubit.get(context).homeScreen[HomeCubit.get(context).currentscreen],
    );
  },
),
);
  }
}
