import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stock_investments/features/stock_add/data/models/stock_info_model.dart';
import 'package:stock_investments/features/stock_add/data/models/stock_price_model.dart';
import 'package:stock_investments/features/stock_add/domain/repositories/stock_repository.dart';

class StockRepositoryImpl implements StockRepository {
  static const _apiKey = 'adc436b838d44286aa8678f963cad9c5';

  @override
  Future<StockPriceModel> getStockPrice(String symbol) async {
    final url =
        'https://api.twelvedata.com/price?symbol=$symbol&apikey=$_apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return StockPriceModel.fromJson(data, symbol);
    } else {
      throw Exception('Failed to load stock price');
    }
  }

  @override
  Future<StockInfoModel> getStockInfo(String name) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/stock'),
      body: jsonEncode({"name": name}),
      headers: {'Content-Type': 'application/json'},
    );

    final json = jsonDecode(response.body);
    return StockInfoModel.fromJson(json);
  }
}
