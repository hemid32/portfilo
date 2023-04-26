import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../resource/color_manager.dart';

class IconSocial extends StatelessWidget {
  const IconSocial({
    Key? key,
    required this.rotationController,  this.active = false , required this.icon, required this.colorActive, required this.onTap, required this.onHover,
  }) : super(key: key);

  final AnimationController rotationController;
  final bool active ;
  final IconData icon  ;
  final Color colorActive ;
  final Function onTap ;
  final Function onHover ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
          onHover: (v){
            if(v) {
              rotationController.forward(from: 0.0);
            }
            onHover(v);

          } ,
          onTap: (){
            onTap() ;
          },
          child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
              //angle: BlocHome.get(context).iconFc ? 2*pi : 0,
              child: Transform.scale(
                  scale:  active ? 1.5 : 1 ,
                  child: FaIcon(icon , color: active ? colorActive :  ColorManager.colorWhite, )))

      ),
    );
  }
}
