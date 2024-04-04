import 'package:flutter/material.dart';

import '../../../../core/utils/app_images.dart';

class CustomPersonImage extends StatelessWidget {
  const CustomPersonImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 50,
      width: 50,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Image.asset(
        AppImages.person,
      ),
    );
  }
}
