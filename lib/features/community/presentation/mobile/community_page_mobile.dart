import 'package:flutter/material.dart';
import 'package:victor_trevisan_login_app/app_get_it.dart';
import 'package:victor_trevisan_login_app/core/constants/app_colors.dart';
import 'package:victor_trevisan_login_app/core/utils/navigation_utils.dart';
import 'package:victor_trevisan_login_app/features/home/presentation/common/controller/home_page_controller.dart';

class CommunityPageMobile extends StatefulWidget {
  const CommunityPageMobile({super.key});

  @override
  State<CommunityPageMobile> createState() => _CommunityPageMobileState();
}

class _CommunityPageMobileState extends State<CommunityPageMobile> {
  HomePageController homePageController =
      AppGetIt.instance.get<HomePageController>();

  @override
  Widget build(BuildContext context) {
    if (homePageController.userEntity.value == null) NavigationUtils.goLogin();
    return Container(
      color: AppColors.lightGrey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 64,
            width: 256,
            decoration: BoxDecoration(
                color: AppColors.white, borderRadius: BorderRadius.circular(4)),
            child: ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                      homePageController.userEntity.value!.avatar)),
              title: Text(
                  '${homePageController.userEntity.value!.firstName} ${homePageController.userEntity.value!.lastName}'),
              subtitle: Text(homePageController.userEntity.value!.email),
              tileColor: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
