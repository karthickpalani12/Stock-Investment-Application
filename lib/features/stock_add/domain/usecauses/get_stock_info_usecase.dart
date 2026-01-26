import '../../data/models/stock_info_model.dart';
import '../repositories/stock_repository.dart';

class GetStockInfoUseCase {
  final StockRepository repository;

  GetStockInfoUseCase(this.repository);

  Future<StockInfoModel> call(String name) {
    return repository.getStockInfo(name);
  }
}
