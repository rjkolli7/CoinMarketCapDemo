import 'package:flutter/material.dart';

import '../helpers/asset_helper.dart';
import '../helpers/color_helpers.dart';
import '../helpers/string_helper.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: ColorHelper.appDark30),
          ),
          height: 40,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Image.asset(
                    AssetHelper.filter,
                    height: 24,
                    width: 24,
                  ),
                ),
                const Text(StringHelper.filter),
              ],
            ),
          ),
        ));
  }
}
