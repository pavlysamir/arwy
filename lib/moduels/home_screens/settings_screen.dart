import 'package:arwyapp/layout/cupit/home_cubit.dart';
import 'package:arwyapp/moduels/LoginScreen/LogiScreen.dart';
import 'package:arwyapp/shared/components/Components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class SettingsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 64.0, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Settings',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                ),),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 90,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: HomeCubit.get(context).colorOfSwtich,
                    borderRadius: BorderRadiusDirectional.circular(24)
                ),
                child: Row(
                  children: [
                    Text('Automated mood',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),),
                    Spacer(),
                    LiteRollingSwitch(
                      width: 100,
                      onTap: () {},
                      onDoubleTap: () {},
                      onSwipe: () {},
                      onChanged: (bool position) {
                        HomeCubit.get(context).ChangeColorOfSwich();
                        print(position);
                      },
                      colorOn: Colors.white24,
                      colorOff: Colors.redAccent,
                    ),


                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: (){},
                child: Container(
                    child: Row(
                      children: [
                        Text('Massemger Chat' ,style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),),
                        Spacer(),
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey.shade300,
                          ),
                          child: Icon(Icons.keyboard_arrow_right),
                        )
                      ],
                    ),
                  )
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 7)
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 50,
                  clipBehavior: Clip.antiAlias,
                  onPressed: (){
                    NavigateTo(context,LoginScreen());
                  },
                  color: Colors.black,
                  child: Text('Log Out' ,
                    style: TextStyle(
                      fontSize: 24,
                       color: Colors.white
                  ),),),
              ),
              SizedBox(
                height: 50,
              ),


            ],
          ),
        );
      },
    );
  }
}
