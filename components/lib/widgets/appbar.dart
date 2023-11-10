import 'package:flutter/material.dart';

import '../helpers/asset_helper.dart';
import '../helpers/color_helpers.dart';

class ToolBar extends StatelessWidget {
  final String title;

  const ToolBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: ColorHelper.appDark, fontSize: 24),
      ),
      automaticallyImplyLeading: false,
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(AssetHelper.bell),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(AssetHelper.settings),
        ),
      ],
    );
  }
}
