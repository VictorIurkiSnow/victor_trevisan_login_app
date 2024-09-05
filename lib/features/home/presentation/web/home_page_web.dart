import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:victor_trevisan_login_app/app_get_it.dart';
import 'package:victor_trevisan_login_app/core/constants/app_colors.dart';
import 'package:victor_trevisan_login_app/core/generic/app_scroll_and_expanded.dart';
import 'package:victor_trevisan_login_app/features/home/presentation/common/controller/home_page_controller.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({super.key});

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  HomePageController controller = AppGetIt.instance.get<HomePageController>();

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    if (controller.userEntity.value == null) {
      await controller.fetchUserId();
      await controller.fetchUserData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScrollAndExpanded(child: Obx(() {
      if (controller.isLoading.value) {
        return Container(
          color: AppColors.lightGrey,
          child: const Center(
            child: CircularProgressIndicator(
              color: AppColors.darkBlue,
            ),
          ),
        );
      } else {
        return Container(
          color: AppColors.lightGrey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 64,
                width: 256,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child:
                          Image.network(controller.userEntity.value!.avatar)),
                  title: Text(
                      '${controller.userEntity.value!.firstName} ${controller.userEntity.value!.lastName}'),
                  subtitle: Text(controller.userEntity.value!.email),
                  tileColor: AppColors.white,
                ),
              ),
            ),
          ),
        );
      }
    }));
  }
}
