class DashboardStock {
  final String symbol;
  final double price;
  final int shares;
  final double co2;
  final double esg;

  DashboardStock({
    required this.symbol,
    required this.price,
    required this.shares,
    required this.co2,
    required this.esg,
  });

  double get totalValue => price * shares;
}
