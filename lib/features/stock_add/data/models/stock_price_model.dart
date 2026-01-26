class StockPriceModel {
  final String symbol;
  final double price;

  StockPriceModel({
    required this.symbol,
    required this.price,
  });

  factory StockPriceModel.fromJson(Map<String, dynamic> json, String symbol) {
    return StockPriceModel(
      symbol: symbol,
      price: double.parse(json['price']),
    );
  }
}
