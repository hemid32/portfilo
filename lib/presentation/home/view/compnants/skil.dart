import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../resource/color_manager.dart';

class SkilItem extends StatelessWidget {
   SkilItem({
    Key? key, required this.title, required this.prcnt,
  }) : super(key: key);
  final String title  ;
  final double prcnt ;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title , style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: ColorManager.colorWhite ,
                fontSize:  15  ,

              )),
            ],
          )  ,
          const  SizedBox(height: 5,) ,

          LinearPercentIndicator(
            padding: EdgeInsets.zero,
            barRadius: const Radius.circular(5),
            width: 500,
            lineHeight: 14.0,
            percent: prcnt,
            center: Text('${prcnt * 100} %' , style: const TextStyle(color: ColorManager.colorWhite),),
            backgroundColor: Colors.grey,
            progressColor: ColorManager.homeRed,
          ),
        ],
      ),
    );
  }
}
