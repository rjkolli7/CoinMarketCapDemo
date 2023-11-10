import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';

import '../components.dart';

class ExchangeCard extends StatelessWidget {
  final CryptoCurrencyListingItem coinItem;

  const ExchangeCard({super.key, required this.coinItem});

  @override
  Widget build(BuildContext context) {
    var quotes = coinItem.quotes ?? List.empty();
    CryptoCurrencyListingItemQuotesItem? quoteItem =
        quotes.isNotEmpty ? quotes[0] : null;
    String price = (quoteItem?.price ?? 0.0).toInt().toString();
    String name = quoteItem?.name ?? '';
    bool isNegative = (quoteItem?.percentChange24h ?? 0) < 0;
    String percentage24h =
        quoteItem?.percentChange24h?.toStringAsFixed(2) ?? '0';
    return Card(
      color: isNegative ? ColorHelper.appRed10 : ColorHelper.appGreen10,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      // color: ,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, top: 40, bottom: 20),
            child: Row(
              children: [
                Image.network(
                  'https://s2.coinmarketcap.com/static/img/coins/64x64/${coinItem.id}.png',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coinItem.symbol ?? 'No Symbol',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ColorHelper.appDark,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      coinItem.name ?? 'No Name',
                      style: const TextStyle(
                        fontSize: 13,
                        color: ColorHelper.appDark,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
              ],
            ),
          ),
          sparkLines(isNegative),
        ],
      ),
    );
  }

  // dummy
  Widget sparkLines(bool isNegative) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: SizedBox(
        height: 60,
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0.1, 55),
                  FlSpot(0.2, 50),
                  FlSpot(0.3, 52),
                  FlSpot(0.4, 50),
                  FlSpot(0.5, 54),
                  FlSpot(0.6, 53),
                  FlSpot(0.7, 53.5),
                  FlSpot(0.8, 45),
                  FlSpot(0.9, 53.5),
                  FlSpot(0.95, 52),
                  FlSpot(1, 60),
                ],
                isCurved: true,
                color: isNegative ? ColorHelper.appRed : ColorHelper.appGreen,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                    show: true,
                    color: isNegative
                        ? ColorHelper.appRed60
                        : ColorHelper.appGreen60 // #00CE08
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
