import 'package:flutter/material.dart';
import 'package:portfilo/presentation/resource/color_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HeaderButtons extends StatelessWidget {
  const HeaderButtons({
    Key? key, required this.onHover, required this.onTap,  this.active = false , required this.title,
  }) : super(key: key);

  final Function onHover ;
  final Function onTap ;
  final bool active ;
  final String title  ;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: InkWell(
        onHover : (v)=> onHover(v) ,
        onTap: (){
          onTap() ;
        },
        child: Transform.scale(
          scale: active  ? 1.2 : 1.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( title  , style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: active  ?  ColorManager.homeRed : ColorManager.colorWhite  ,
                fontWeight: active  ? FontWeight.bold : null ,
                //decoration: TextDecoration.underline
              )),
              const SizedBox(height: 10,) ,
              if(active)
              SizedBox(
                  width: 7 * title.length + .0 ,
                  height: 5,
                  child: const Divider(color: ColorManager.homeRed, height: 10 , ))
            ],
          ),
        ),
      ),
    );
  }
}
