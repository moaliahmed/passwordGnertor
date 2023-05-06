import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:passwordgnerator/model/passwordModel.dart';

part 'view_password_state.dart';

class ViewPasswordCubit extends Cubit<ViewPasswordState> {
  ViewPasswordCubit() : super(ViewPasswordInitial());
  static ViewPasswordCubit get(context)=>BlocProvider.of(context);
  
List <passwordModel>? passwordList;
  viewData(){
    print('2');
    var password = Hive.box<passwordModel>('password_box');
passwordList =password.values.toList();
    emit(ViewPasswordSuccess());

  }
}
