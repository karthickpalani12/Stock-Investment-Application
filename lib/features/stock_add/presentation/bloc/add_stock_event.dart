abstract class AddStockEvent {}

class SearchStockSelected extends AddStockEvent {
  final String symbol;

  SearchStockSelected(this.symbol);
}

class AddStockToPortfolio extends AddStockEvent {
  final String symbol;
  final double price;
  final int shares;

  AddStockToPortfolio({
    required this.symbol,
    required this.price,
    required this.shares,
  });
}
