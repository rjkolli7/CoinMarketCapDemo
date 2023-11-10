import 'package:bloc/bloc.dart';
import 'package:components/components.dart';
import 'package:components/widgets/exchange_card.dart';
import 'package:components/widgets/exchange_list.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';

class CryptoCurrencyTab extends StatelessWidget {
  const CryptoCurrencyTab({super.key});

  @override
  Widget build(BuildContext context) {
    var block = CryptoCurrencyListingBloc();
    block.getTop20CryptoCurrencyListing();
    return StreamBuilder(
        stream: block.top20CryptoCurrencyListingStream,
        builder: (context, AsyncSnapshot<CryptoCurrencyListing> snapshot) {
          if (snapshot.data != null) {
            var cryptoList =
                snapshot.data?.data?.cryptoCurrencyList ?? List.empty();
            return cryptoList.isNotEmpty
                ? ListView(
                    shrinkWrap: true,
                    children: [
                      ExchangeCard(coinItem: cryptoList[0]),
                      const SizedBox(height: 8),
                      titleWidget(),
                      const SizedBox(height: 8),
                      ExchangeList(
                          cryptoCurrencyList:
                              snapshot.data?.data?.cryptoCurrencyList),
                    ],
                  )
                : Container();
          }
          return Container();
        });
  }

  Widget titleWidget() {
    return const Row(
      children: [
        Expanded(
            child: Text(
          StringHelper.topCryptocurrencies,
          style: TextStyle(
            color: ColorHelper.appDark,
            fontSize: 18,
          ),
        )),
        Text(
          StringHelper.viewAll,
          style: TextStyle(
            color: ColorHelper.appDark50,
            fontSize: 13,
          ),
        )
      ],
    );
  }
}
