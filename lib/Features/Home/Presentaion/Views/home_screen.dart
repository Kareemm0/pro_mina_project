import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_mina_project/Features/Home/Presentaion/Cubit/home_cubit.dart';
import 'package:pro_mina_project/Features/Home/Presentaion/Widgets/custom_grid_body.dart';
import 'package:pro_mina_project/Features/Home/Presentaion/Widgets/custom_person_image.dart';
import 'package:pro_mina_project/Features/Home/Presentaion/Widgets/custom_row_two_buttons.dart';
import 'package:pro_mina_project/core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(Dio()),
      child: Scaffold(
        backgroundColor: AppColors.homeScaffoldBackground,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 40,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //! Person Name
                  Text(
                    "Welcome\n Mina",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: AppColors.balckNormal,
                    ),
                  ),
                  //! Person Image
                  const CustomPersonImage(),
                ],
              ),
              const SizedBox(height: 36),
              //! Two Buttons
              const CustomRowTwoButtons(),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                    itemCount: 50,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return const CustomGridBody();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
