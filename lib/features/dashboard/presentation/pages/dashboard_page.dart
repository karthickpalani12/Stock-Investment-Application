import 'package:flutter/material.dart';
import 'package:stock_investments/constant/app_text_style.dart';
import 'package:stock_investments/features/dashboard/presentation/widget/co2_impact_card.dart';
import 'package:stock_investments/features/dashboard/presentation/widget/green_score_card.dart';
import 'package:stock_investments/features/dashboard/presentation/widget/stock_tile.dart';
import 'package:stock_investments/features/dashboard/presentation/widget/total_value_card.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_investments/features/stock_details/presentation/pages/stock_details_page.dart';
import 'package:stock_investments/navigation/app_routes.dart';
import 'package:stock_investments/theme/theme_cubit.dart';
import '../bloc/dashboard_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Portfolio Overview',
          style: AppTextStyle.appBarHeadingText,
        ),
        leading: const Icon(Icons.nights_stay_outlined),
        actions: [
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return Switch(
                value: themeMode == ThemeMode.dark,
                onChanged: (_) {
                  context.read<ThemeCubit>().toggleTheme();
                },
              );
            },
          ),
        ],
        elevation: 0,
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TotalValueCard(
                        totalValue: state.totalValue,
                      ),
                    ),
                    Expanded(
                      child: Co2ImpactCard(
                        totalCo2: state.totalCo2,
                      ),
                    ),
                    Expanded(
                      child: GreenScoreCard(
                        score: state.greenScore,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'My Stocks',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                if (state.stocks.isEmpty)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        'No stocks added yet',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ...state.stocks.map(
                  (stock) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: StockTile(
                      name: stock.symbol,
                      shares:
                          '${stock.shares} shares • ₹${stock.price.toStringAsFixed(2)}',
                      value: '₹${stock.totalValue.toStringAsFixed(0)}',
                      co2: '${stock.co2} t/yr',
                      esg: stock.esg.toString(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => StockDetailsPage(stock: stock),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.addStock);
                    },
                    icon: const Icon(Icons.add),
                    label: Text(
                      'Add Stock',
                      style: AppTextStyle.buttonText,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
