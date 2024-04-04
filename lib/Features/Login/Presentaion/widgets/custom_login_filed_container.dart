import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_mina_project/Features/Login/Presentaion/Cubit/login_cubit.dart';
import 'package:pro_mina_project/Features/Login/Presentaion/Cubit/login_state.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/functions/app_vaild.dart';
import '../../../../core/widgets/custom_app_material_button.dart';
import '../../../../core/widgets/custom_text_form_filed.dart';

class CustomLoginFiledContainer extends StatelessWidget {
  const CustomLoginFiledContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      final cubit = context.read<LoginCubit>();
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurStyle: BlurStyle.inner,
                  blurRadius: 20,
                  color: AppColors.whiteBlur)
            ],
            border: Border.all(color: AppColors.transparnt),
            borderRadius: BorderRadius.circular(16)),
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
              Text(
                "LOG IN",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.balckNormal),
              ),
              const SizedBox(height: 24),
              //! User Name Filed
              CustomTextFromFiled(
                controller: cubit.useNameController,
                hinText: "User Name",
                validator: (val) {
                  return AppValidator.displayNameValidator(
                      cubit.useNameController.text);
                },
              ),
              const SizedBox(height: 24),
              //! password Filed
              CustomTextFromFiled(
                validator: (val) => AppValidator.passwordVaildtor(
                    cubit.passwordController.text),
                controller: cubit.passwordController,
                hinText: "Password",
              ),
              const SizedBox(height: 24),
              //! Material Button
              state is LoginLoadingState
                  ? const CircularProgressIndicator()
                  : CustomMaterialButton(
                      widget: const SizedBox(),
                      text: "SUBMIT",
                      onPressed: () {
                        cubit.login();
                      },
                    ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      );
    });
  }
}
