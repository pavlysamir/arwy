import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  bool OnSucurepass = true;
  Icon suffixIcon = Icon(
    Icons.remove_red_eye,
    color: Colors.black,
  );
  void changeVisiblePass(){

     OnSucurepass? suffixIcon = Icon(
  Icons.remove_red_eye,
  color: Colors.black,
) :suffixIcon = Icon(
    Icons.visibility_off,
        color: Colors.black,
);
     OnSucurepass = !OnSucurepass ;
     emit(LoginChangeVisiblePassword());
  }
}
