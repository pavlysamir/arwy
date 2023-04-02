import 'package:arwyapp/shared/components/Components.dart';
import 'package:flutter/material.dart';

class VegetablesScreen extends StatelessWidget {
  var HeroTap;
  VegetablesScreen(this.HeroTap);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: cropsScreens(
          HeroTap: HeroTap,
          imagePath:  'assets/images/vege.png',
          textUnderImg: 'klam 3n nbta , klam 3n nbta , klam 3n nbta , klam 3n nbta ,'
              ' klam 3n nbta , klam 3n nbta , klam 3n nbta , klam 3n nbta ,'
              ' klam 3n nbta , klam 3n nbta , klam 3n nbta '),
    );
  }
}
