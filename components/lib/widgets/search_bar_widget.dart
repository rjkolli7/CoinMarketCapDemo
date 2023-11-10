import 'package:flutter/material.dart';

import '../helpers/asset_helper.dart';
import '../helpers/color_helpers.dart';
import '../helpers/string_helper.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorHelper.appDark05,
        borderRadius: BorderRadius.circular(30),
      ),
      height: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          maxLines: 1,
          style: const TextStyle(color: ColorHelper.appDark), // Text color
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(bottom: 12.0),
            icon: Image.asset(
              AssetHelper.search,
            ),
            hintText: StringHelper.searchCryptocurrency,
            hintStyle: const TextStyle(
              color: ColorHelper.appDark30,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
