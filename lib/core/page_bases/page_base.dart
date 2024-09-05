import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
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

  final Color selectedColor = const Color(0xFF0A0E21);

  final Color unselectedColor = const Color.fromARGB(255, 135, 144, 240);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        //APP-BAR
        appBar: AppBar(
          title: const Text(
            'Tecnofit Login App',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              onPressed: () {
                NavigationUtils.pushReplacement(AppRoutes.login.path);
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
            ),
          ],
        ),

        //BOTTOM-NAVIGATION-BAR
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            backgroundColor: Colors.white60,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Community',
              ),
            ],
            currentIndex: selectedIndex.value,
            selectedItemColor: selectedColor,
            unselectedItemColor: unselectedColor,
            onTap: (index) {
              selectedIndex.value = index;
              if (index == 0) {
                NavigationUtils.goHome();
              } else {
                NavigationUtils.goCommunity();
              }
            },
          );
        }),

        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
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
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  NavigationUtils.goHome();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Community'),
                onTap: () {
                  NavigationUtils.goCommunity();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: widget.child,
      ),
    );
  }
}
