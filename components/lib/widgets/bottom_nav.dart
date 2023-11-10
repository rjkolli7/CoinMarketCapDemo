import 'package:flutter/material.dart';

import '../helpers/asset_helper.dart';
import '../helpers/color_helpers.dart';
import '../helpers/string_helper.dart';

class BottomNav extends StatelessWidget {
  final ValueChanged<int>? onTap;
  final int selectedIndex;

  const BottomNav(
      {super.key, required this.onTap, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorHelper.appDark,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorHelper.appWhite,
        unselectedItemColor: ColorHelper.appWhite40,
        enableFeedback: false,
        selectedLabelStyle:
            const TextStyle(color: ColorHelper.appWhite, fontSize: 10),
        unselectedLabelStyle:
            const TextStyle(color: ColorHelper.appWhite40, fontSize: 10),
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(AssetHelper.eshop, 0),
            label: StringHelper.eshop,
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(AssetHelper.exchange, 1),
            label: StringHelper.exchange,
          ),
          BottomNavigationBarItem(
            icon: Container(),
            label: '', // Empty label for the bug icon without text
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(AssetHelper.launchpad, 3),
            label: StringHelper.launchpads,
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(AssetHelper.wallet, 4),
            label: StringHelper.wallet,
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(String imagePath, int index) {
    return Image.asset(
      imagePath,
      width: 20,
      height: 20,
      color: selectedIndex == index
          ? ColorHelper.appWhite
          : ColorHelper.appWhite40,
    );
  }
}
