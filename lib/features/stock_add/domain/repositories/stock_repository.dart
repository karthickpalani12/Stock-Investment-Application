import 'package:stock_investments/features/stock_add/data/models/stock_info_model.dart';
import 'package:stock_investments/features/stock_add/data/models/stock_price_model.dart';

abstract class StockRepository {
  Future<StockPriceModel> getStockPrice(String symbol);

  Future<StockInfoModel> getStockInfo(String name);
}
