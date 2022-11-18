import 'package:chatwithfirebase/app/constants.dart';
import 'package:chatwithfirebase/utilities/resources/values_manager.dart';
import 'package:chatwithfirebase/view/pages/bag_page.dart';
import 'package:chatwithfirebase/view/pages/home_page.dart';
import 'package:chatwithfirebase/view/pages/profile_page.dart';
import 'package:chatwithfirebase/view/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _HomeState();
}

class _HomeState extends State<BottomBarPage> {
  final bottomNavBarController = PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PersistentTabView(
        context,
        controller: bottomNavBarController,
        screens: const [
          HomePage(),
          ShopPage(),
          BagPage(),
          ProfilePage(),
        ],
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            title: "Home",
            activeColorPrimary: kErrorColor,
            inactiveColorPrimary: kSecondColorLightTheme,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.shopping_cart_outlined),
            title: "Shop",
            activeColorPrimary: kErrorColor,
            inactiveColorPrimary: kSecondColorLightTheme,
          ),
          PersistentBottomNavBarItem(
            icon: SvgPicture.asset("assets/icons/active_shop.svg"),
            inactiveIcon: SvgPicture.asset("assets/icons/inactive_shop.svg"),
            title: "Bag",
            activeColorPrimary: kErrorColor,
            inactiveColorPrimary: kSecondColorLightTheme,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(FontAwesomeIcons.user),
            title: "Profile",
            activeColorPrimary: kErrorColor,
            inactiveColorPrimary: kSecondColorLightTheme,
          ),
        ],
        confineInSafeArea: true,
        backgroundColor: kWhiteColor,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white,
          borderRadius: BorderRadius.circular(AppSize.s14),
        ),
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.linear,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: false,
        ),
        navBarStyle: NavBarStyle.style9,
      ),
    );
  }
}
