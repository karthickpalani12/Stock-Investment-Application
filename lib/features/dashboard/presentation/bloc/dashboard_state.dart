part of 'dashboard_bloc.dart';

class DashboardState {
  final List<DashboardStock> stocks;
  final double totalValue;
  final double totalCo2;
  final int greenScore;

  DashboardState({
    required this.stocks,
    required this.totalValue,
    required this.totalCo2,
    required this.greenScore,
  });

  factory DashboardState.initial() => DashboardState(
        stocks: [],
        totalValue: 0,
        totalCo2: 0,
        greenScore: 0,
      );

  DashboardState copyWith({
    List<DashboardStock>? stocks,
    double? totalValue,
    double? totalCo2,
    int? greenScore,
  }) {
    return DashboardState(
      stocks: stocks ?? this.stocks,
      totalValue: totalValue ?? this.totalValue,
      totalCo2: totalCo2 ?? this.totalCo2,
      greenScore: greenScore ?? this.greenScore,
    );
  }
}
