part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginChangeVisiblePassword extends LoginState {}

class LoginLoadingState extends LoginState{}

class LoginSuccessState extends LoginState{
  String uId;
  LoginSuccessState({required this.uId});
}
class LoginErrorState extends LoginState {
  late final String? error;
  LoginErrorState(this.error);
}
