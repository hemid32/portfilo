import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfilo/presentation/resource/color_manager.dart';

class HomeSmall extends StatelessWidget {
  const HomeSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HEMIDI DEV', style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: ColorManager.homeRed ,
      ), ),
       leading: FaIcon(Icons.menu),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );

  }
}
