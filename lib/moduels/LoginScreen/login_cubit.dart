import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../shared/constant.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  bool OnSucurepass = true;
  Icon suffixIcon = Icon(
    Icons.remove_red_eye,
    color: Colors.black,
  );
  void changeVisiblePass() {
    OnSucurepass
        ? suffixIcon = Icon(
            Icons.remove_red_eye,
            color: Colors.black,
          )
        : suffixIcon = Icon(
            Icons.visibility_off,
            color: Colors.black,
          );
    OnSucurepass = !OnSucurepass;
    emit(LoginChangeVisiblePassword());
  }

  void loginUser({required String email, required var password}) async {
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        emit(LoginSuccessState(uId: '${value.user!.uid}'));
      });
      //print(credential!.user!.email);
      //  print('${uId}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      emit(LoginErrorState(e.code));
    }
    // FirebaseAuth.instance.signInWithEmailAndPassword(
    //    email: email,
    //    password: password
    // ).then((value) {
    //   print(value.user!.email);
    //   print(value.user!.uid);
    //   emit(LoginSuccessState());
    //   FirebaseAuthException  (e) {
    //     if (e.code == 'user-not-found') {
    //       print('No user found for that email.');
    //     } else if (e.code == 'wrong-password') {
    //       print('Wrong password provided for that user.');
    //     }
    //     emit(LoginErrorState(e.toString()));}
    // }).catchError((error){
    //
    // });
  }
}
