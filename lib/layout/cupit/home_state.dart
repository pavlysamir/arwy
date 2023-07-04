part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeBottomBar extends HomeState{}
class ChangeColorOfContainer extends HomeState{}
class ChangeColorOfSwitch extends HomeState{}


class writeondatasuccsses extends HomeState{}
class writeondataerror extends HomeState{
  late final String? error;
  writeondataerror(this.error);
}


class readOnDataSuccess extends HomeState{}
class readOnDataError extends HomeState{
  late final String? error;
  readOnDataError(this.error);
}

class getMessagesSuccess extends HomeState{}
class getMessagesError extends HomeState{
  late final String? error;
  getMessagesError(this.error);
}

class sendMessagesSuccess extends HomeState{}
class sendMessagesError extends HomeState{
  late final String? error;
  sendMessagesError(this.error);
}
