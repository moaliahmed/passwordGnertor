import 'package:hive/hive.dart';
part 'passwordModel.g.dart';
@HiveType(typeId: 1)
class passwordModel extends HiveObject{
@HiveField(0)
final String email;
@HiveField(1)
final String password;

  passwordModel({required this.email,required this.password, });
}