import 'package:flutter_bloc/flutter_bloc.dart';

class BlocHome extends Cubit<StateBlocHome>   {
  BlocHome() : super(IntStateBlocHome()) ;

  static BlocHome get(context ) => BlocProvider.of(context) ;


  // buttons header
  bool b1 = false ;
  changeB1(bool b) {
    b1 = b ;
    emit(IntStateBlocHome()) ;
  }
  bool b2 = false ;
  changeB2(bool b) {
    b2 = b ;
    emit(IntStateBlocHome()) ;
  }

  bool b3 = false ;
  changeB3(bool b) {
    b3 = b ;
    emit(IntStateBlocHome()) ;
  }
  bool b4 = false ;
  changeB4(bool b) {
    b4 = b ;
    emit(IntStateBlocHome()) ;
  }


  // icons
  bool iconFc = false ;
  changeFc(bool b) {
    iconFc = b ;
    emit(IntStateBlocHome()) ;
  }
  bool iconGh = false ;
  changeGh(bool b) {
    iconGh = b ;
    emit(IntStateBlocHome()) ;
  }
  bool iconLd = false ;
  changeLd(bool b) {
    iconLd = b ;
    emit(IntStateBlocHome()) ;
  }

  //  animation text
  bool finichedTextAnimation = false ;
  changeFinichedTextAnimation(bool b) {
    finichedTextAnimation = b ;
    emit(IntStateBlocHome()) ;
  }







}


abstract class StateBlocHome {}

class IntStateBlocHome extends StateBlocHome {}