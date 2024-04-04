import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_mina_project/Features/Login/Presentaion/Cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  final TextEditingController useNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  login() async {
    final isVaild = formKey.currentState!.validate();
    if (isVaild) {
      //! qheller@example.com
      try {
        final response = await Dio().post(
          'https://flutter.prominaagency.com/api/auth/login',
          data: {
            "email": useNameController.text,
            "password": passwordController.text,
          },
        );
        if (response.statusCode == 200) {
          emit(LoginSuccessState());
        } else {
          emit(LoginFailureState(message: "Login Fail"));
        }
        //  print("Success====================$respose");
        print(response.data);
      } catch (error) {
        // print("Error====================$error");
        emit(LoginFailureState(message: error.toString()));
      }
    }
  }
}
