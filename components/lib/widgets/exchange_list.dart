import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:network/network.dart';

import '../components.dart';

class ExchangeList extends StatelessWidget {
  final List<CryptoCurrencyListingItem>? cryptoCurrencyList;

  const ExchangeList({super.key, this.cryptoCurrencyList});

  @override
  Widget build(BuildContext context) {
    var filteredList =
        cryptoCurrencyList?.where((element) => element.id != 1).toList() ??
            List.empty();
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        CryptoCurrencyListingItem item = filteredList[index];
        String cryptoName = item.name ?? 'No Name';
        String cryptoSymbol = item.symbol ?? 'No Symbol';
        var quotes = item.quotes ?? List.empty();
        CryptoCurrencyListingItemQuotesItem? quoteItem =
            quotes.isNotEmpty ? quotes[0] : null;
        String price = (quoteItem?.price ?? 0.0).toInt().toString();
        String name = quoteItem?.name ?? '';
        bool isNegative = (quoteItem?.percentChange24h ?? 0) < 0;
        String percentage24h =
            quoteItem?.percentChange24h?.toStringAsFixed(2) ?? '0';
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 0,
          ),
          title: Row(
            children: [
              Image.network(
                'https://s2.coinmarketcap.com/static/img/coins/64x64/${item.id}.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    cryptoName,
                    style: const TextStyle(
                      color: ColorHelper.appDark,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    cryptoSymbol,
                    style: const TextStyle(
                      color: ColorHelper.appDark,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SvgPicture.network(
                  'https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/${item.id}.svg',
                  colorFilter: ColorFilter.mode(
                    isNegative ? ColorHelper.appRed : ColorHelper.appGreen,
                    BlendMode.srcATop,
                  ),
                  height: 30,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "\$$price $name",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorHelper.appDark,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "${isNegative ? '' : '+'}$percentage24h%",
                      style: TextStyle(
                          fontSize: 13,
                          color: isNegative
                              ? ColorHelper.appRed
                              : ColorHelper.appGreen,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
