import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'generat_random_password_state.dart';

class GeneratRandomPasswordCubit extends Cubit<GeneratRandomPasswordState> {
  GeneratRandomPasswordCubit() : super(GeneratRandomPasswordInitial());
static GeneratRandomPasswordCubit get (context)=>BlocProvider.of(context);
  String gnertatPassword='' ;
  double currentSliderValue = 4;
  bool? checkNumber = false;
  bool? checkSymbol = false;
   String? selectedItem = 'Random Password';

 updataPassword(){
                                if (selectedItem == 'Random Password') {
                                if (checkNumber == true &&
                                    checkSymbol == true) {
                                  generatRandomValue();
                                } else if (checkNumber == true) {
                                  generatRandomWordNumber();
                                } else if (checkSymbol == true) {
                                  generatRandomWordSymble();
                                } else if (checkNumber == false &&
                                    checkSymbol == false) {
                                  generatRandomWord();
                                }
                              } else if (selectedItem == 'PIN') {
                                generatRandomNumber();
                              } else {}
 }

  generatRandomValue() {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890!@#\$%^&*()<>';
    Random _rnd = Random();

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    
      gnertatPassword = getRandomString(currentSliderValue.toInt());
    emit(GeneratRandomPasswordUpdate());
  }

  generatRandomWord() {
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    Random _rnd = Random();

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  
      gnertatPassword = getRandomString(currentSliderValue.toInt());
     emit(GeneratRandomPasswordUpdate());

  }

  generatRandomWordSymble() {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz!@#\$%^&*()<>';
    Random _rnd = Random();

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    
      gnertatPassword = getRandomString(currentSliderValue.toInt());
        emit(GeneratRandomPasswordUpdate());

  }

  generatRandomWordNumber() {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    
      gnertatPassword = getRandomString(currentSliderValue.toInt());
        emit(GeneratRandomPasswordUpdate());

  }

  generatRandomNumber() {
    const _chars = '1234567890';
    Random _rnd = Random();

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    
      gnertatPassword = getRandomString(currentSliderValue.toInt());
        emit(GeneratRandomPasswordUpdate());

  }


}
