import 'package:flutter/material.dart';
import 'package:stock_investments/constant/app_text_style.dart';
import 'package:stock_investments/features/dashboard/domain/entities/dashboard_stock.dart';
import 'package:stock_investments/features/stock_details/presentation/widget/card_container.dart';
import 'package:stock_investments/features/stock_details/presentation/widget/emission_bar_chart.dart';
import 'package:stock_investments/features/stock_details/presentation/widget/trend_bar_chart.dart';

class StockDetailsPage extends StatelessWidget {
  final DashboardStock stock;

  const StockDetailsPage({
    super.key,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stock Details',
          style: AppTextStyle.appBarHeadingText,
        ),
        leading: const BackButton(),
        actions: const [
          Icon(Icons.more_horiz),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Text(
                    stock.symbol[0],
                    style: AppTextStyle.circleAvatarNameText,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stock.symbol,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '₹ ${stock.price.toStringAsFixed(2)}  +1.35 (+0.7%)',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(),
            const SizedBox(height: 10),
            Text(
              'Shares Owned : ${stock.shares.toString()}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              'Total Value: ₹ ${stock.totalValue.toStringAsFixed(0)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            CardContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CO₂ Emissions | year',
                    style: AppTextStyle.barChartHeadingText,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.cloud, color: Colors.green),
                      SizedBox(width: 8),
                      Text(
                        '${stock.co2} tons/year',
                        style: AppTextStyle.barChartSubHeadingText,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const EmissionBarChart(),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Suggest Eco-Friendly Stocks',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            CardContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CO₂ Emissions Trend',
                    style: AppTextStyle.barChartHeadingText,
                  ),
                  SizedBox(height: 16),
                  TrendBarChart(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
