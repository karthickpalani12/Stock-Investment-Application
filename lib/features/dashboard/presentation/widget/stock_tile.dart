import 'package:flutter/material.dart';
import 'package:stock_investments/constant/app_text_style.dart';

class StockTile extends StatelessWidget {
  final String name;
  final String shares;
  final String value;
  final String co2;
  final String esg;
  final VoidCallback onTap;

  const StockTile({
    super.key,
    required this.name,
    required this.shares,
    required this.value,
    required this.co2,
    required this.esg,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 1,
        child: ListTile(
          leading: CircleAvatar(
            child: Text(name[0],style: AppTextStyle.circleAvatarName2Text,),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: AppTextStyle.cardTitleText,
                  ),
                  Text(
                    value,
                    style: AppTextStyle.cardTitleText,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                shares,
                style: AppTextStyle.cardSubTitleText,
              ),
              const SizedBox(height: 5),
              Text(
                'CO₂: $co2 | ESG: $esg',
                style: AppTextStyle.cardSubTitleText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
