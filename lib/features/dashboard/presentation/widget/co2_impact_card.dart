import 'package:flutter/material.dart';
import 'package:stock_investments/constant/app_text_style.dart';
import 'package:stock_investments/features/dashboard/presentation/widget/summary_card.dart';

import 'package:flutter/material.dart';

class Co2ImpactCard extends StatelessWidget {
  final double totalCo2;

  const Co2ImpactCard({
    super.key,
    required this.totalCo2,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total CO₂ Impact',
                style: AppTextStyle.dashBoardCardHeadingText,
              ),
              const SizedBox(height: 8),
              Text(
                '${totalCo2.toStringAsFixed(1)} \ntons/yr',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
