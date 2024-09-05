import 'package:flutter/material.dart';
import 'package:victor_trevisan_login_app/app_get_it.dart';
import 'package:victor_trevisan_login_app/core/constants/app_colors.dart';
import 'package:victor_trevisan_login_app/core/utils/navigation_utils.dart';
import 'package:victor_trevisan_login_app/features/home/presentation/common/controller/home_page_controller.dart';
import 'package:victor_trevisan_login_app/core/widgets/app_list_tile.dart';

class CommunityPageWeb extends StatefulWidget {
  const CommunityPageWeb({super.key});

  @override
  State<CommunityPageWeb> createState() => _CommunityPageWebState();
}

class _CommunityPageWebState extends State<CommunityPageWeb> {
  HomePageController homePageController =
      AppGetIt.instance.get<HomePageController>();

  @override
  Widget build(BuildContext context) {
    if (homePageController.userEntity.value == null) NavigationUtils.goLogin();
    return Container(
      color: AppColors.lightGrey,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 1000,
                      width: 400,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 4,
                        ),
                        itemCount: 20,
                        itemBuilder: (context, index) => AppListTile(
                          controller: homePageController,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 1000,
                      width: 400,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 4,
                        ),
                        itemCount: 20,
                        itemBuilder: (context, index) => AppListTile(
                          controller: homePageController,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
