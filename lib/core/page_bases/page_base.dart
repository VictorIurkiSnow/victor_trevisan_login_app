// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:victor_trevisan_login_app/core/constants/app_colors.dart';
import 'package:victor_trevisan_login_app/core/constants/app_routes.dart';
import 'package:victor_trevisan_login_app/core/utils/navigation_utils.dart';

class PageBase extends StatefulWidget {
  const PageBase({super.key, required this.child});

  final Widget child;

  @override
  State<PageBase> createState() => _PageBaseState();
}

class _PageBaseState extends State<PageBase> {
  final RxInt selectedIndex = 0.obs;
  final RxString title = 'Home'.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,

        //STACK
        body: Stack(
          children: [
            widget.child,
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    height: 56, // Altura da AppBar
                    decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        )),
                    child: AppBar(
                      iconTheme: IconThemeData(color: AppColors.white),
                      title: Text(
                        title.value,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      centerTitle: true,
                      backgroundColor: Colors
                          .transparent, // Torna a cor transparente para o Container acima
                      elevation: 0, // Remove a sombra da AppBar
                      actions: [
                        IconButton(
                          onPressed: () {
                            NavigationUtils.pushReplacement(
                                AppRoutes.login.path);
                          },
                          icon: const Icon(
                            Icons.exit_to_app,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        //BOTTOM-NAVIGATION-BAR
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedIconTheme: IconThemeData(color: AppColors.lightBlue),
            unselectedIconTheme: IconThemeData(color: AppColors.darkGrey),
            backgroundColor: AppColors.white,
            fixedColor: AppColors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: ''),
            ],
            currentIndex: selectedIndex.value,
            onTap: (index) {
              selectedIndex.value = index;
              if (index == 0) {
                title.value = 'Home';
                NavigationUtils.goHome();
              } else {
                title.value = 'Community';
                NavigationUtils.goCommunity();
              }
            },
          );
        }),

        drawer: Drawer(
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
          child: ListView(
            children: [
              SizedBox(
                height: 80,
                child: const DrawerHeader(
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                  ),
                  child: Center(
                    child: Text(
                      'Tecnofit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  title.value = 'Home';
                  NavigationUtils.goHome();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Community'),
                onTap: () {
                  title.value = 'Community';
                  NavigationUtils.goCommunity();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
