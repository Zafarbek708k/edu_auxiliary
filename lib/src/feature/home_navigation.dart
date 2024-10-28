import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:edu_auxiliary/src/core/constants/context_extension.dart';
import 'package:edu_auxiliary/src/core/widgets/drawer.dart';
import '../core/widgets/advanced_drawer/advanced_drawer.dart';
import '../core/widgets/advanced_drawer/drawer_controller.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: AdvancedDrawerController(),
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16))),
      backdropColor: context.appTheme.primary,
      drawer:  const CustomMainDrawer(),
      child: Scaffold(
        key: HomeNavigation.scaffoldKey,
        body: widget.navigationShell,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(splashColor: Colors.transparent, highlightColor: Colors.transparent),
          child: DecoratedBox(
            decoration: const BoxDecoration(border: Border.symmetric(vertical: BorderSide(color: Colors.black, width: 5))),
            child: BottomNavigationBar(
              selectedLabelStyle: context.appTextStyle.bodyMedium,
              unselectedLabelStyle: context.appTextStyle.bodyMedium,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              unselectedFontSize: 8,  // Adjust sizes
              selectedFontSize: 10,
              unselectedItemColor: context.appTheme.secondary,
              selectedItemColor: Colors.blue,
              elevation: 0,
              backgroundColor: context.appTheme.secondaryContainer,
              currentIndex: widget.navigationShell.currentIndex,
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_max), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "My courses"),
                BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: "Inbox"),
                BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "Profile"),
              ],
              onTap: (index) => _onItemTapped(index),
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}

