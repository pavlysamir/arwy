import 'package:arwyapp/shared/components/Components.dart';
import 'package:flutter/material.dart';

class GrassScreen extends StatelessWidget {
  var HeroTap;
  GrassScreen(this.HeroTap);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: cropsScreens(
          HeroTap: HeroTap,
          imagePath:  'assets/images/grace.png',
          textUnderImg: 'klam 3n nbta , klam 3n nbta , klam 3n nbta , klam 3n nbta ,'
              ' klam 3n nbta , klam 3n nbta , klam 3n nbta , klam 3n nbta ,'
              ' klam 3n nbta , klam 3n nbta , klam 3n nbta '),
    );
  }
}
