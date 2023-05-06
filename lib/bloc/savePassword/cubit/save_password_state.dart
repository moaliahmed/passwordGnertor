part of 'save_password_cubit.dart';

@immutable
abstract class SavePasswordState {}

class SavePasswordInitial extends SavePasswordState {}
class SavePasswordLoding extends SavePasswordState {}
class SavePasswordSuccess extends SavePasswordState {}
class SavePasswordError extends SavePasswordState {
  final String erro;

  SavePasswordError(this.erro);
}
