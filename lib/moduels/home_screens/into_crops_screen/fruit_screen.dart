import 'package:arwyapp/shared/components/Components.dart';
import 'package:flutter/material.dart';

class FruitScreen extends StatelessWidget {
  var HeroTap;
  FruitScreen(this.HeroTap);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: cropsScreens(
          HeroTap: HeroTap,
          imagePath:  'assets/images/froty.png',
          textUnderImg: 'klam 3n nbta , klam 3n nbta , klam 3n nbta , klam 3n nbta ,'
              ' klam 3n nbta , klam 3n nbta , klam 3n nbta , klam 3n nbta ,'
              ' klam 3n nbta , klam 3n nbta , klam 3n nbta '),
    );
  }
}
