


import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'style_manager.dart';

//TextTheme textTheme = GoogleFonts.tajawalTextTheme() ;

ThemeData getThemeData(){

  return ThemeData(
    // main theme
    primaryColorLight: ColorManager.regGrouna  ,
    backgroundColor: ColorManager.colorBackGround ,
    scaffoldBackgroundColor: ColorManager.primaryColor,
    primaryColor:  ColorManager.regGrouna ,
    disabledColor: ColorManager.coloBehaver,
    splashColor: ColorManager.colorWhite,
    // theme dialog
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)) ,
      contentTextStyle: styleMedeum() ,
      titleTextStyle: styleBold() ,
      backgroundColor: ColorManager.colorDialog ,
    ),

    // card theme
    cardTheme:    CardTheme(
      color: ColorManager.colorWhite ,
      clipBehavior: Clip.antiAliasWithSaveLayer ,

      shadowColor: ColorManager.colorGray,

      //shape: ShapeBorder
      elevation: 4 ,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)) ,
    ),


    // appbar theme

    appBarTheme: AppBarTheme(
      color: ColorManager.primaryColor ,
      elevation: 4,
      shadowColor: ColorManager.colorGray,
      titleTextStyle: styleBold(color: Colors.white) ,
    ),


    // button themeData
    buttonTheme: const   ButtonThemeData(
        shape: StadiumBorder() ,
        disabledColor: ColorManager.colorGray ,
        buttonColor: ColorManager.primaryColor
    ),


    // elevent button
    elevatedButtonTheme: ElevatedButtonThemeData(


      style: ElevatedButton.styleFrom(textStyle: styleMedeum(color: Colors.white) , shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)) , primary: ColorManager.primaryColor ,
        padding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ) ,
    ),


    // text Theme
    textTheme: TextTheme(
      titleLarge: styleBold() ,
      titleMedium: styleMedeum() ,
      headlineMedium: styleMedeum() ,
      headlineLarge: styleExtraBold() ,

      //button: styleMedeum() ,
      //titleSmall: styleLight() ,
      //bodyText1: styleMedeum() ,

    ) ,

    // text form theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.colorBlack.withOpacity(0.04),


      contentPadding:
      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0 , right: 14.0),
      hintStyle:   styleMedeum(color: ColorManager.colorHintText) ,
      labelStyle: styleMedeum(color: ColorManager.colorHintText) ,
      errorStyle: styleReguler(color: ColorManager.colorRed) ,
      // enable border stayle
      enabledBorder: OutlineInputBorder(borderSide:  BorderSide(
        color: ColorManager.colorBlackText.withOpacity(0.1) ,
        width: 1 ,

      ), borderRadius: BorderRadius.circular(8)),

      // focuse border style

      focusedBorder:  OutlineInputBorder(borderSide: const BorderSide(
        color: ColorManager.primaryColor ,
        width: 1.5 ,

      ), borderRadius: BorderRadius.circular(8)),

      // error border  style
      errorBorder:  OutlineInputBorder(borderSide: const BorderSide(
        color: ColorManager.colorRed ,
        width: 1.5 ,

      ), borderRadius: BorderRadius.circular(8)),



    ) ,

  );
}