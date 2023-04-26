import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:portfilo/presentation/home/model_view/model_view.dart';
import 'package:portfilo/presentation/home/view/home_smail.dart';
import 'package:portfilo/presentation/resource/color_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/constant.dart';
import 'compnants/animation_typeWriter.dart';
import 'compnants/buttons.dart';
import 'compnants/icons.dart';
import 'compnants/skil.dart';


double _sizeText = 35  ;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController rotationControllerFc;
  late AnimationController rotationControllerGh;
  late AnimationController rotationControllerLd;
  @override
  void initState() {
    rotationControllerFc = AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
        animationBehavior: AnimationBehavior.preserve);
    rotationControllerGh = AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
        animationBehavior: AnimationBehavior.preserve);
    rotationControllerLd = AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
        animationBehavior: AnimationBehavior.preserve);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BlocHome(),
        child: Builder(builder: (context) {
          return LayoutBuilder(
            builder: (context , cnst ) {
              return cnst.maxWidth < 1050  ? const HomeSmall() : Scaffold(
                body: BlocBuilder<BlocHome, StateBlocHome>(
                    builder: (context, snapshot) {
                  return  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: Adaptive.w(5)),
                      child: Column(
                        children: [
                          // header
                          Container(
                            height: 100,
                            width: Adaptive.w(100),
                            decoration: BoxDecoration(
                              color: ColorManager.primaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // may logo
                                Row(
                                  children: [
                                    //Image.network("https://st4.depositphotos.com/5040187/19700/v/600/depositphotos_197008712-stock-illustration-hb-logo-swoosh-global-red.jpg")
                                    //,
                                    //SizedBox(width: 10,) ,

                                    Text(
                                      'HEMIDI DEV',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            color: ColorManager.homeRed,
                                          ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: Adaptive.h(10),
                                ),

                                // buttons
                                Expanded(
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Spacer() ,
                                      HeaderButtons(
                                        onTap: () {},
                                        onHover: (v) =>
                                            BlocHome.get(context).changeB1(v),
                                        title: 'Home',
                                        active: BlocHome.get(context).b1,
                                      ),
                                      HeaderButtons(
                                        onTap: () {},
                                        onHover: (v) =>
                                            BlocHome.get(context).changeB2(v),
                                        title: 'Project',
                                        active: BlocHome.get(context).b2,
                                      ),
                                      HeaderButtons(
                                        onTap: () {},
                                        onHover: (v) =>
                                            BlocHome.get(context).changeB3(v),
                                        title: 'Download cv',
                                        active: BlocHome.get(context).b3,
                                      ),
                                      HeaderButtons(
                                        onTap: () {},
                                        onHover: (v) =>
                                            BlocHome.get(context).changeB4(v),
                                        title: 'Bloc',
                                        active: BlocHome.get(context).b4,
                                      ),
                                      ElevatedButton(onPressed: (){}, style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(ColorManager.homeRed)
                                      ), child: Text('Contact me' , style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                        color: ColorManager.colorWhite
                                      ),) ,)  ,
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: Adaptive.h(10),
                                ),

                                Row(
                                  children: [
                                    IconSocial(
                                      rotationController: rotationControllerFc,
                                      icon: FontAwesomeIcons.facebook,
                                      colorActive: Colors.blue,
                                      active: BlocHome.get(context).iconFc,

                                      onHover: (v) =>
                                          BlocHome.get(context).changeFc(v),
                                      onTap: () {},
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    IconSocial(
                                      rotationController: rotationControllerGh,
                                      icon: FontAwesomeIcons.github,
                                      colorActive: Colors.black,
                                      active: BlocHome.get(context).iconGh,
                                      onHover: (v) =>
                                          BlocHome.get(context).changeGh(v),
                                      onTap: () {},
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    IconSocial(
                                      rotationController: rotationControllerLd,
                                      active: BlocHome.get(context).iconLd,

                                      icon: FontAwesomeIcons.linkedin,
                                      colorActive: Colors.blue,
                                      onHover: (v) =>
                                          BlocHome.get(context).changeLd(v),
                                      onTap: () {},
                                    ),                            ],
                                )
                              ],
                            ),
                          ) ,

                         const  SizedBox(height: 100,),

                          // body

                          Row(
                            children: [
                              const SizedBox(
                                  height: 150,
                                  child: VerticalDivider(width: 4, color: ColorManager.colorWhite,)) ,
                              const SizedBox(width: 25,)  ,
                              AnimatedRichText(listTextSpan: [
                                        TextSpan(text:  'Hey there!\n' , style : Theme.of(context).textTheme.titleLarge!.copyWith(
                                          color: ColorManager.colorWhite ,
                                          fontSize: _sizeText

                                        )) ,
                                        TextSpan(text:  'I\'m Hemidi Benameur\n' ,  style : Theme.of(context).textTheme.titleLarge!.copyWith(
                                            color: ColorManager.colorWhite ,
                                            fontSize: _sizeText

                                        )) ,
                                        TextSpan(text:  'Independent ' , style : Theme.of(context).textTheme.titleLarge!.copyWith(
                                            color: ColorManager.colorWhite ,
                                            fontSize: _sizeText

                                        )) ,
                                        TextSpan(text:  'Flutter  &\n Back-end Developer' , style : Theme.of(context).textTheme.titleLarge!.copyWith(
                                            color: ColorManager.homeRed ,
                                            fontSize: _sizeText

                                        )) ,

                                      ]
                                 ,) ,
                              const Spacer() ,

                              Container(
                                width: Adaptive.w(30),
                                height: Adaptive.w(30),
                                decoration: const  BoxDecoration(
                                  shape: BoxShape.circle ,
                                  image: DecorationImage(
                                    image: NetworkImage('https://media.licdn.com/dms/image/C4E03AQHmxjv96A_F3w/profile-displayphoto-shrink_800_800/0/1619065203768?e=1687996800&v=beta&t=LysTx0XSqC6hDO3UsnY1DFhBtR3iFqp5NlMMINjQ-Bg') ,
                                    fit: BoxFit.fill
                                  )

                                ),

                                //child: ,
                              )


                            ],
                          )  ,


                          Row(
                            children: [
                              ElevatedButton(onPressed: (){}, child: Text('  Contect me  ') ,
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(ColorManager.homeRed) ,
                                padding:
                                MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 35, vertical: 20)),
                                  shape: MaterialStateProperty.all( RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))

                              ),

                              ) ,
                            ],
                          )  ,

                          const  SizedBox(height: 100,),

                          // about me

                          Row(
                            children: [


                              RichText(text: TextSpan(
                                  style:  Theme.of(context).textTheme.titleLarge!.copyWith(
                                      fontSize: _sizeText ,
                                      fontWeight: FontWeight.bold ,
                                    color: ColorManager.colorWhite
                                  ) ,
                                children: [
                                  TextSpan(text:  'ABOUT ') ,
                                  TextSpan(text:  'ME' , style: TextStyle(color: ColorManager.homeRed)) ,

                                ]
                              ))
                            ],
                          ) ,
                          const  SizedBox(height: 30,) ,


                          Container(
                            margin: const  EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10) ,
                              border: Border.all(color: ColorManager.homeRed)
                            ),
                            child: Row(
                              children: [

                                Container(
                                  height: 600,
                                  width:  300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                      image: NetworkImage('https://images.pexels.com/photos/5935791/pexels-photo-5935791.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500') ,
                                      fit: BoxFit.fill
                                    )
                                  ),
                                ) ,
                                const  SizedBox(width: 20,) ,

                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(aboutMe , style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        color: ColorManager.colorWhite ,
                                        fontSize:  17  ,

                                      ),textAlign: TextAlign.justify,),

                                      const  SizedBox(height: 20,) ,

                                      Row(
                                        children: [
                                          Text('SKILLS' ,  style:  Theme.of(context).textTheme.titleLarge!.copyWith(
                                              fontSize: 23 ,
                                              fontWeight: FontWeight.bold ,
                                              color: ColorManager.homeRed
                                          ) ,),
                                        ],
                                      ),
                                      const  SizedBox(height: 10,) ,
                                      SkilItem(
                                        title: 'Dart',
                                        prcnt: .9,
                                      ) ,
                                      SkilItem(
                                        title: 'python',
                                        prcnt: .7,
                                      ) ,
                                      SkilItem(
                                        title: 'JS',
                                        prcnt: .6,
                                      ) ,
                                      SkilItem(
                                        title: 'php',
                                        prcnt: .6,
                                      )  ,
                                      SkilItem(
                                        title: 'java',
                                        prcnt: .6,
                                      ) ,
                                      const  SizedBox(height: 20,) ,
                                      // tools
                                      Row(
                                        children: [
                                          Text('TOOLS' ,  style:  Theme.of(context).textTheme.titleLarge!.copyWith(
                                              fontSize: 23 ,
                                              fontWeight: FontWeight.bold ,
                                              color: ColorManager.homeRed
                                          ) ,),
                                        ],
                                      ),
                                      //const  SizedBox(height: 10,) ,

                                      Row(

                                        children: [
                                          iconTool('https://raw.githubusercontent.com/simple-icons/simple-icons/eb90e446e41fd23f5e9190f51d4ba5e34d1c620a/icons/androidstudio.svg' ,
                                            'https://developer.android.com/'
                                          ) ,
                                          iconTool('https://raw.githubusercontent.com/simple-icons/simple-icons/eb90e446e41fd23f5e9190f51d4ba5e34d1c620a/icons/git.svg'
                                              , 'https://github.com/hemid32') ,
                                          iconTool('https://raw.githubusercontent.com/simple-icons/simple-icons/eb90e446e41fd23f5e9190f51d4ba5e34d1c620a/icons/arduino.svg',
                                              'https://www.arduino.cc/') ,
                                          iconTool('https://raw.githubusercontent.com/simple-icons/simple-icons/eb90e446e41fd23f5e9190f51d4ba5e34d1c620a/icons/apple.svg',
                                              'https://www.apple.com'),
                                          iconTool('https://raw.githubusercontent.com/simple-icons/simple-icons/eb90e446e41fd23f5e9190f51d4ba5e34d1c620a/icons/firebase.svg',
                                              'https://www.firebase.com'),
                                          //iconTool('https://www.svgrepo.com/show/354202/postman-icon.svg',
                                          //    'urlTarget'),
                                          iconTool('https://raw.githubusercontent.com/simple-icons/simple-icons/eb90e446e41fd23f5e9190f51d4ba5e34d1c620a/icons/docker.svg',
                                              'https://www.docker.com'),
                                          iconTool('https://raw.githubusercontent.com/simple-icons/simple-icons/eb90e446e41fd23f5e9190f51d4ba5e34d1c620a/icons/azuredevops.svg',
                                              'devOps'),

                                          
                                          //iconTool(url, urlTarget)
                                          
                                          
                                        ],
                                      )



                                    ],
                                  ),
                                ) ,






                              ],
                            ),
                          )  ,

                          //



                          const  SizedBox(height: 100,),

                          // tools





                        ],
                      ),
                    ),
                  );
                }),
              );
            }
          );
        }));
  }

  Widget iconTool(String url , String urlTarget) {
    return InkWell(
      onTap: (){
        launch(urlTarget) ;
      },
      child: Container(
                                            width: 35,
                                            height: 35,
                                            margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                                            alignment: Alignment.center,
                                            clipBehavior: Clip.antiAliasWithSaveLayer,
                                            decoration: const  BoxDecoration(
                                              color: ColorManager.colorWhite,
                                              shape: BoxShape.circle,
                                            ),

                                            child: SvgPicture.network(url , width: 30, height: 30, fit: BoxFit.fill,),

                                          ),
    );
  }
}

