import 'package:flutter/material.dart';
import 'package:victor_trevisan_login_app/core/constants/app_colors.dart';
import 'package:victor_trevisan_login_app/features/home/presentation/common/controller/home_page_controller.dart';

class AppListTile extends StatelessWidget {
  const AppListTile(
      {super.key, required this.controller, this.height, this.width});

  final HomePageController controller;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 64,
      width: width ?? 280,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(4)),
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(controller.userEntity.value!.avatar)),
        title: Text(
            '${controller.userEntity.value!.firstName} ${controller.userEntity.value!.lastName}'),
        subtitle: Text(controller.userEntity.value!.email, maxLines: 1),
        tileColor: AppColors.white,
      ),
    );
  }
}
