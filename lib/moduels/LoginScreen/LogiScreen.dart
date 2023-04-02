import 'package:arwyapp/layout/home_screen.dart';
import 'package:arwyapp/moduels/LoginScreen/login_cubit.dart';
import 'package:arwyapp/shared/components/Components.dart';
import 'package:arwyapp/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  var IdController = TextEditingController();
  var PasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {},
  builder: (context, state) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
                child: Image.asset(
              'assets/images/login.jpg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
            )),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: IdController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'please Enter your ID';
                        }
                      },
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        fillColor: Colors.white60,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        label: Text(
                          'ID',
                          style: TextStyle(color: Colors.black),
                        ),
                        prefixIcon:
                            Icon(Icons.person_outline, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: LoginCubit.get(context).OnSucurepass,
                      controller: PasswordController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'please Enter your password';
                        }
                      },
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: Colors.red[400],
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        fillColor: Colors.white60,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        label: Text(
                          'Password',
                          style: TextStyle(color: Colors.black),
                        ),
                        prefixIcon: Icon(
                          Icons.lock_open_outlined,
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          onPressed: (){
                            LoginCubit.get(context).changeVisiblePass();
                          },
                          icon: LoginCubit.get(context).suffixIcon,
                        )
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            NavigateAndFinish(context, HomeScreen());
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 24),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  },
),
);
  }
}
