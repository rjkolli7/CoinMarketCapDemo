import 'package:coinmarketcapdemo/modules/exchange/cryptocurrancies.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';

class ExchangePage extends StatelessWidget {
  const ExchangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Expanded(child: SearchBarWidget()),
                  FilterWidget(),
                ],
              ),
            ),
            const TabBar(
              indicator: UnderlineTabIndicator(borderSide: BorderSide.none),
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              indicatorWeight: 0,
              dividerColor: Colors.transparent,
              indicatorPadding: EdgeInsets.zero,
              automaticIndicatorColorAdjustment: false,
              padding: EdgeInsets.zero,
              labelColor: ColorHelper.appDark,
              unselectedLabelColor: ColorHelper.appDark30,
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              tabs: [
                Tab(text: StringHelper.cryptocurrency),
                Tab(text: StringHelper.nft),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const CryptoCurrencyTab(),
                    // Content of Tab 2
                    Container(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
