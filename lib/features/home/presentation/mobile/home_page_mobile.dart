import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:victor_trevisan_login_app/app_get_it.dart';
import 'package:victor_trevisan_login_app/core/constants/app_colors.dart';
import 'package:victor_trevisan_login_app/core/widgets/app_scroll_and_expanded.dart';
import 'package:victor_trevisan_login_app/features/home/presentation/common/controller/home_page_controller.dart';
import 'package:victor_trevisan_login_app/core/widgets/app_list_tile.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
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
        return Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
                color: AppColors.lightGrey,
                height: MediaQuery.of(context).size.height - 100,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 4,
                            ),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) => AppListTile(
                              controller: controller,
                              height: 80,
                            )),
                  ),
                )),
          ],
        );
      }
    }));
  }
}
