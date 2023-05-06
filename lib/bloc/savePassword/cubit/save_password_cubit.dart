import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:passwordgnerator/model/passwordModel.dart';

part 'save_password_state.dart';

class SavePasswordCubit extends Cubit<SavePasswordState> {
  SavePasswordCubit() : super(SavePasswordInitial());
  static SavePasswordCubit get (context)=> BlocProvider.of(context);

  addPassword(passwordModel passowrd){
    emit(SavePasswordLoding());
var passwordbox=Hive.box<passwordModel>('password_box');
try {
  passwordbox.add(passowrd);
  print('Success');
  emit(SavePasswordSuccess());
} on Exception catch (e) {
  emit(SavePasswordError(e.toString()));
}
  }
}
