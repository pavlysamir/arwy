import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_icons/weather_icons.dart';

void NavigateTo(context , Widget){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context)=> Widget),
  );
}

void NavigateAndFinish(context , Widget){
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context)=> Widget),
          (route) => false);
}

Widget containerOfstats({
  required String degree , 
  required BoxedIcon icon  ,
  required String iconName}){
  return Container(
    height: 130,
    width: 150,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400,width: 1),
        borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(16),
            topEnd:  Radius.circular(16),
            bottomEnd:  Radius.circular(16),
            bottomStart:  Radius.circular(16)
        )
    ),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$degree' +'\u00B0',
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 40,
                fontWeight: FontWeight.w600
            ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text('$iconName',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)
            ],
          )
        ],
      ),
    ),
  );
}


Widget progressIndecator(
{
  required String degree,
  required double valueOfIndecator,
  required Color color,
  required BoxedIcon icon,
  required String iconName
}
    ){
  return Column(
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              value: valueOfIndecator,
              strokeWidth: 10,
              color: color,
              backgroundColor: Colors.grey.shade300,
            ),
          ),
          Text('$degree'+'%' , style: TextStyle(fontSize: 40 , color: color),),
        ],
      ),
      SizedBox(height: 15,),
      Row(
        children: [
          icon,
          Text('$iconName' ,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)

        ],
      )
    ],
  );

}

Widget cropsScreens(
{
  required var HeroTap,
  required String imagePath,
  required String textUnderImg,

}
    ){

  return Column(
    children: [
      Container(
        width: double.infinity,
        height: 200,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        clipBehavior: Clip.antiAlias,
        child: Hero(
          tag: HeroTap,
          child: Image.asset(imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(textUnderImg,maxLines: 10,
          style: TextStyle(fontSize: 20),
        ),
      ),
    ],
  );
}

void showToast(
    {required String messege,
      required ColorStates colorToast,
    }
    ){
  Fluttertoast.showToast(
      msg: messege,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: shooseCloreToast(colorToast),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ColorStates{SUCCESS,ERROR,WARNING}

Color shooseCloreToast(ColorStates state)
{
  Color color;
  if(state == ColorStates.SUCCESS){
    color = Colors.green.withOpacity(0.8);
  }else  if(state == ColorStates.ERROR){
    color = Colors.red;
  }else  color = Colors.amber;

  return color;
}
