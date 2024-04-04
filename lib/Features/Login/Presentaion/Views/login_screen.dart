import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pro_mina_project/Features/Login/Presentaion/Cubit/login_cubit.dart';
import 'package:pro_mina_project/Features/Login/Presentaion/Cubit/login_state.dart';
import 'package:pro_mina_project/Features/Login/Presentaion/widgets/custom_login_filed_container.dart';
import 'package:pro_mina_project/core/utils/app_colors.dart';
import 'package:pro_mina_project/core/utils/app_images.dart';
import '../../../../core/functions/app_router.dart';
import '../../../../core/widgets/custom_snack_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if (state is LoginLoadingState) {
          Center(
              child: CircularProgressIndicator(
            color: AppColors.homeScaffoldBackground,
          ));
        } else if (state is LoginSuccessState) {
          showSnackBar(
            text: "Login Successfly",
            color: AppColors.green,
            context: context,
          );
          context.push(AppRouter.homescreen);
        } else if (state is LoginFailureState) {
          showSnackBar(
              text: state.message, color: AppColors.red, context: context);
        }
      }, builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.pink,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //! Image
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(AppImages.camer),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "My\n Gellary",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackOpacity),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  //! login Field Container
                  const CustomLoginFiledContainer(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
