import 'package:flutter/material.dart';
import 'package:stock_investments/constant/app_text_style.dart';

class GreenScoreCard extends StatelessWidget {
  final int score;

  const GreenScoreCard({
    super.key,
    required this.score,
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
                'Green Score',
                style: AppTextStyle.dashBoardCardHeadingText,
              ),
              const SizedBox(height: 8),
              Text(
                '$score / 100',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
