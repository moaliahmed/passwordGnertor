import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:passwordgnerator/model/passwordModel.dart';
import 'package:passwordgnerator/src/app_root.dart';

main()async{
 await Hive.initFlutter();
   Hive.registerAdapter(passwordModelAdapter());
 await Hive.openBox<passwordModel>('password_box');
  runApp(AppRoot());
}