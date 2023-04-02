import 'package:arwyapp/moduels/home_screens/into_crops_screen/fruit_screen.dart';
import 'package:arwyapp/moduels/home_screens/into_crops_screen/grass_screen.dart';
import 'package:arwyapp/moduels/home_screens/into_crops_screen/vegetables_screen.dart';
import 'package:arwyapp/shared/components/Components.dart';
import 'package:flutter/material.dart';

class CropsScreen extends StatelessWidget {
  var HeroFruitPath = 'assets/images/froty.png';
  var HeroVegetablesPath = 'assets/images/vege.png';
  var HerograssPath = 'assets/images/grace.png';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset('assets/images/home.png'),
                Container(
                  height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(18),
                          topStart: Radius.circular(18))),
                )
              ],
            ),
            InkWell(
              onTap: (){
                NavigateTo(context, FruitScreen(HeroFruitPath));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                //padding: EdgeInsets.only(left: 18,right: 18),
                decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30)
                  ), //BorderRadius.horizontal
                ),
                clipBehavior: Clip.antiAlias,

                child: Row(
                  children: [
                    Text(
                      '    Fruit',
                      style: TextStyle(fontSize: 24 ,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Stack(
                      children: [
                        Hero(
                          tag: HeroFruitPath,
                          child: Image.asset(
                            'assets/images/froty.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Image.asset(
                          'assets/images/dhk.png',
                          fit: BoxFit.cover,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                NavigateTo(context, VegetablesScreen(HeroVegetablesPath));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30)
                  ), //BorderRadius.horizontal
                ),
                clipBehavior: Clip.antiAlias,
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Hero(

                          tag:HeroVegetablesPath,
                          child: Image.asset(
                            'assets/images/vege.png',
                            fit: BoxFit.cover,
                          ),
                        ),

                        Image.asset(
                          'assets/images/dhk2.png',
                          fit: BoxFit.cover,
                        ),
                      ],

                    ),
                    Text(
                      '    Vegetables',
                      style: TextStyle(fontSize: 24 ,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                NavigateTo(context, GrassScreen(HerograssPath));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                //padding: EdgeInsets.only(left: 18,right: 18),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.all(
                      Radius.circular(30)
                  ), //BorderRadius.horizontal
                ),
                clipBehavior: Clip.antiAlias,

                child: Row(
                  children: [
                    Text(
                      '    Grass',
                      style: TextStyle(fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Spacer(),
                    Stack(
                      children: [
                        Hero(
                          tag: HerograssPath,
                          child: Image.asset(
                            'assets/images/grace.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Image.asset(
                          'assets/images/dhk.png',
                          fit: BoxFit.cover,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
