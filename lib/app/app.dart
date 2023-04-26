import 'package:flutter/material.dart';
import 'package:portfilo/main.dart';
import 'package:portfilo/presentation/resource/theme_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../presentation/home/view/home.dart';

class MayApp extends StatelessWidget {
  //const MayApp({Key? key}) : super(key: key);
  MayApp._internal();

  static final MayApp _instance = MayApp._internal();

  factory MayApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Responsive Sizer Example',

          debugShowCheckedModeBanner: false,
          theme: getThemeData(),

          home: Home(),
        );
      },
      maxTabletWidth: 900, // Optional
    );
  }
}
