import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_mina_project/Features/Home/Presentaion/Cubit/home_cubit.dart';
import 'package:pro_mina_project/Features/Home/Presentaion/Cubit/home_state.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../custom_app_material_button.dart';

chooseImageDialog(context) {
  showDialog(
    context: context,
    builder: (context) => BlocProvider(
      create: (context) => HomeCubit(Dio()),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return Dialog(
            backgroundColor: Colors.transparent,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                height: MediaQuery.sizeOf(context).height * .3,
                padding: const EdgeInsets.all(8),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(color: AppColors.white),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomMaterialButton(
                      onPressed: () {
                        cubit.pickImage(ImageSource.gallery);
                      },
                      borderRadius: BorderRadius.circular(20),
                      width: MediaQuery.sizeOf(context).width * .45,
                      color: AppColors.blackOpacity,
                      text: "Gellary",
                      widget: Image.asset(AppImages.gellary),
                      buttonColor: AppColors.homeScaffoldBackground,
                    ),
                    const SizedBox(height: 30),
                    CustomMaterialButton(
                      onPressed: () {
                        cubit.pickImage(ImageSource.camera);
                      },
                      borderRadius: BorderRadius.circular(20),
                      width: MediaQuery.sizeOf(context).width * .45,
                      color: AppColors.blackOpacity,
                      text: "Camera",
                      widget: Image.asset(AppImages.camera),
                      buttonColor: AppColors.blueopacity,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
