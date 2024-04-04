import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_mina_project/Features/Home/Presentaion/Cubit/home_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_app_material_button.dart';
import '../../../../core/widgets/dialog/choose_image_dialog.dart';
import '../Cubit/home_state.dart';

class CustomRowTwoButtons extends StatelessWidget {
  const CustomRowTwoButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Row(
          children: [
            Flexible(
              child: CustomMaterialButton(
                onPressed: () {
                  context.read<HomeCubit>().getGellary();
                },
                widget: Image.asset(AppImages.logout),
                fontSize: 18,
                text: "log out ",
                buttonColor: AppColors.white,
                color: AppColors.balckNormal,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            const SizedBox(width: 26),
            Flexible(
              child: CustomMaterialButton(
                onPressed: () {
                  chooseImageDialog(context);
                },
                widget: Image.asset(AppImages.upload),
                fontSize: 18,
                text: "upload",
                buttonColor: AppColors.white,
                color: AppColors.balckNormal,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ],
        );
      },
    );
  }
}
