import 'package:stock_investments/features/stock_add/data/models/stock_price_model.dart';
import 'package:stock_investments/features/stock_add/domain/repositories/stock_repository.dart';

class GetStockPriceUseCase {
  final StockRepository repository;

  GetStockPriceUseCase(this.repository);

  Future<StockPriceModel> call(String symbol) {
    return repository.getStockPrice(symbol);
  }
}
