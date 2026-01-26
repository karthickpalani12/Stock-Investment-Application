enum AddStockStatus {
  initial,
  loading,
  success,
  failure,
}


class AddStockState {
  final String symbol;
  final double? price;
  final double? co2;
  final double? esg;
  final bool isLoading;
  final AddStockStatus status;
  final String? message;

  AddStockState({
    this.symbol = '',
    this.price,
    this.co2,
    this.esg,
    this.isLoading = false,
    this.status = AddStockStatus.initial,
    this.message,
  });

  AddStockState copyWith({
    String? symbol,
    double? price,
    double? co2,
    double? esg,
    bool? isLoading,
    AddStockStatus? status,
    String? message,
  }) {
    return AddStockState(
      symbol: symbol ?? this.symbol,
      price: price ?? this.price,
      co2: co2 ?? this.co2,
      esg: esg ?? this.esg,
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
      message: message,
    );
  }
}
