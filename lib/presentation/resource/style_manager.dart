import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

TextStyle _getTextStyle({ String  fontFamily = FontFamilyManager.fontFamilyPrimary, Color color =  ColorManager.colorGray ,required  double fontSize  , required FontWeight fontWeight  }){
  return TextStyle(color: color , fontSize: fontSize , fontWeight:  fontWeight , fontFamily: fontFamily) ;
}


TextStyle styleReguler({double fontSize = FontSizeManager.s15 , FontWeight fontWeight = FontWeightManager.regular , Color color =  ColorManager.colorBlackText }){
  return _getTextStyle(fontSize: fontSize , fontWeight: fontWeight , color: color ) ;
}

TextStyle styleLight({double fontSize = FontSizeManager.s12 , FontWeight fontWeight = FontWeightManager.light , Color color =  ColorManager.colorBlackText }){
  return _getTextStyle(fontSize: fontSize , fontWeight: fontWeight , color: color ) ;
}

TextStyle styleExtraLight({double fontSize = FontSizeManager.s8 , FontWeight fontWeight = FontWeightManager.extraLight , Color color =  ColorManager.colorBlackText }){
  return _getTextStyle(fontSize: fontSize , fontWeight: fontWeight , color: color ) ;
}

TextStyle styleMedeum({double fontSize = FontSizeManager.s18 , FontWeight fontWeight = FontWeightManager.medium , Color color =  ColorManager.colorBlackText }){
  return _getTextStyle(fontSize: fontSize , fontWeight: fontWeight , color: color ) ;
}

TextStyle styleBold({double fontSize = FontSizeManager.s22 , FontWeight fontWeight = FontWeightManager.bold , Color color =  ColorManager.colorBlackText }){
  return _getTextStyle(fontSize: fontSize , fontWeight: fontWeight , color: color ) ;
}

TextStyle styleExtraBold({double fontSize = FontSizeManager.s24 , FontWeight fontWeight = FontWeightManager.extraBold , Color color =  ColorManager.colorBlackText }){
  return _getTextStyle(fontSize: fontSize , fontWeight: fontWeight , color: color ) ;
}




/*
TextStyle boldStyleWhite({double fontSize = FontSizeManager.s25 , FontWeight fontWeight = FontWeightManager.bold , Color color =  ColorManager.colorWhite }){
  return _getTextStyle(fontSize: fontSize , fontWeight: fontWeight , color: color ) ;
}
TextStyle boldStyleGray({double fontSize = FontSizeManager.s25 , FontWeight fontWeight = FontWeightManager.bold , Color color =  ColorManager.colorGray }){
  return _getTextStyle(fontSize: fontSize , fontWeight: fontWeight , color: color ) ;
}
TextStyle boldStyleBlack({double fontSize = FontSizeManager.s25 , FontWeight fontWeight = FontWeightManager.bold , Color color =  ColorManager.colorBlack }){
  return _getTextStyle(fontSize: fontSize , fontWeight: fontWeight , color: color ) ;
}

 */
