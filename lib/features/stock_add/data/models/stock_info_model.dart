class StockInfoModel {
  final String name;
  final double esgScore;
  final double co2Emissions;
  final String sustainableValue;

  StockInfoModel({
    required this.name,
    required this.esgScore,
    required this.co2Emissions,
    required this.sustainableValue,
  });

  factory StockInfoModel.fromJson(Map<String, dynamic> json) {
    return StockInfoModel(
      name: json['name'],
      esgScore: (json['esg_score'] as num).toDouble(),
      co2Emissions: (json['co2_emissions'] as num).toDouble(),
      sustainableValue: json['sustainable_value'],
    );
  }
}
