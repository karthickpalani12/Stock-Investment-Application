import 'package:flutter/material.dart';
import 'package:stock_investments/constant/app_text_style.dart';

class TotalValueCard extends StatelessWidget {
  final double totalValue;

  const TotalValueCard({
    super.key,
    required this.totalValue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        color: const Color(0x9CBCD2FF),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Portfolio Value',
                style: AppTextStyle.dashBoardCardHeadingText,
              ),
              const SizedBox(height: 8),
              Text(
                '₹${totalValue.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
