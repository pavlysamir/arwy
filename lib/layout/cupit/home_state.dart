part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeBottomBar extends HomeState{}
class ChangeColorOfContainer extends HomeState{}
class ChangeColorOfSwitch extends HomeState{}
