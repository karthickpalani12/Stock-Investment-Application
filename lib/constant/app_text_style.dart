import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:stock_investments/constant/app_colors.dart';

class AppTextStyle {
  static TextStyle appBarHeadingText = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle inputTextHeadingText = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle subHeadingText = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle dashBoardCardHeadingText = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static TextStyle cardInfoText = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  static TextStyle cardTitleText = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
  );

  static TextStyle cardSubTitleText = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static TextStyle circleAvatarNameText = const TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w500,
  );

  static TextStyle circleAvatarName2Text = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static TextStyle buttonText = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle barChartHeadingText = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );
  static TextStyle barChartSubHeadingText = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );
}
