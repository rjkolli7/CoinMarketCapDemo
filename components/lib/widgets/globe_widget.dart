import 'package:flutter/material.dart';

import '../helpers/asset_helper.dart';

class GlobeWidget extends StatelessWidget {
  const GlobeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 1,
        ),
        Align(
          child: Container(
            width: 120,
            height: 120,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AssetHelper.globe,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
