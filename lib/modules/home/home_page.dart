import 'package:coinmarketcapdemo/modules/exchange/exhange_page.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  var titles = [
    StringHelper.eshop,
    StringHelper.exchange,
    '',
    StringHelper.launchpads,
    StringHelper.wallet
  ];

  var pages = [
    Container(),
    const ExchangePage(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: BottomNav(
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedIndex: _selectedIndex),
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: ToolBar(title: titles[_selectedIndex])),
          body: pages[_selectedIndex],
        ),
        const GlobeWidget()
      ],
    );
  }
}
