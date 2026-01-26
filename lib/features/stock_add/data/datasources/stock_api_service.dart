import 'dart:convert';
import 'package:http/http.dart' as http;

class StockApiService {
  Future<double> fetchStockPrice(String symbol) async {
    final url =
        'https://api.twelvedata.com/price?symbol=$symbol&apikey=adc436b838d44286aa8678f963cad9c5';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['price'] != null) {
        return double.parse(data['price']);
      } else {
        throw Exception('Price not found');
      }
    } else {
      throw Exception('Failed to fetch price');
    }
  }

  Future<Map<String, dynamic>> fetchStockInfo(String name) async {
    final response = await http.post(
      Uri.parse('https://stock-server-bku8.onrender.com/stock'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"name": name}),
    );

    return jsonDecode(response.body);
  }
}
