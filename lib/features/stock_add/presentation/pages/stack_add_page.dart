import 'package:flutter/material.dart';
import 'package:stock_investments/constant/app_text_style.dart';
import 'package:stock_investments/features/dashboard/domain/entities/dashboard_stock.dart';
import 'package:stock_investments/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:stock_investments/features/stock_add/data/datasources/stock_api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_investments/features/stock_add/presentation/bloc/add_stock_bloc.dart';
import 'package:stock_investments/features/stock_add/presentation/bloc/add_stock_event.dart';
import 'package:stock_investments/features/stock_add/presentation/bloc/add_stock_state.dart';

class StockAddPage extends StatefulWidget {
  const StockAddPage({super.key});

  @override
  State<StockAddPage> createState() => _StockAddPageState();
}

class _StockAddPageState extends State<StockAddPage> {
  final StockApiService _stockApiService = StockApiService();
  final TextEditingController _symbolController = TextEditingController();
  final TextEditingController _sharesController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();

  bool get isFormValid =>
      _symbolController.text.isNotEmpty &&
      _sharesController.text.isNotEmpty &&
      _priceController.text.isNotEmpty;
  final List<String> stockSymbols = [
    'AAPL',
    'TSLA',
    'XOM',
    'MSFT',
    'GOOGL',
    'AMZN',
    'META',
    'NFLX',
    'NVDA',
    'JPM',
  ];

  List<String> filteredStocks = [];
  bool showDropdown = false;

  double selectedPrice = 0;
  double totalValue = 0;

  void calculateTotal() {
    final shares = int.tryParse(_sharesController.text) ?? 0;
    setState(() {
      totalValue = shares * selectedPrice;
      _totalPriceController.text = totalValue.toStringAsFixed(2);
    });
  }

  String mapSustainability(String rating) {
    const high = ['AAA', 'AA', 'A'];
    const medium = ['BBB', 'BB', 'B'];
    const low = ['CCC', 'CC', 'C'];

    if (high.contains(rating)) return 'High';
    if (medium.contains(rating)) return 'Medium';
    if (low.contains(rating)) return 'Low';

    return 'Unknown';
  }

  double? esgScore;
  double? co2Emissions;
  String? sustainability;
  bool isLoadingESG = false;

  @override
  void dispose() {
    _symbolController.dispose();
    _sharesController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddStockBloc, AddStockState>(
      listenWhen: (previous, current) =>
          current.status == AddStockStatus.success,
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.message!),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Stock',
            style: AppTextStyle.appBarHeadingText,
          ),
          leading: const BackButton(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Stock...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      filteredStocks = stockSymbols
                          .where((s) =>
                              s.toLowerCase().contains(value.toLowerCase()))
                          .toList();
                      showDropdown =
                          value.isNotEmpty && filteredStocks.isNotEmpty;
                    });
                  },
                ),
                if (showDropdown && filteredStocks.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredStocks.length,
                        itemBuilder: (context, index) {
                          final symbol = filteredStocks[index];
                          return ListTile(
                            title: Text(symbol),
                            onTap: () async {
                              _searchController.text = symbol;
                              showDropdown = false;
                              filteredStocks.clear();
                              setState(() {
                                isLoadingESG = true;
                              });
                              try {
                                final price = await _stockApiService
                                    .fetchStockPrice(symbol);
                                final info = await _stockApiService
                                    .fetchStockInfo(symbol);

                                setState(() {
                                  selectedPrice = price;
                                  _priceController.text =
                                      price.toStringAsFixed(2);
                                  _symbolController.text = symbol;

                                  esgScore =
                                      (info['esg_score'] as num).toDouble();
                                  co2Emissions =
                                      (info['co2_emissions'] as num).toDouble();
                                  sustainability = mapSustainability(
                                    info['sustainable_value'] as String,
                                  );

                                  isLoadingESG = false;
                                  calculateTotal();
                                });
                              } catch (e) {
                                debugPrint('ESG API error: $e');
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                Text(
                  'Stock Symbol',
                  style: AppTextStyle.inputTextHeadingText,
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: _symbolController,
                  readOnly: true,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    hintText: 'Stock Symbol',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 14),
                Text(
                  'Number of Shares',
                  style: AppTextStyle.inputTextHeadingText,
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: _sharesController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter Number Of Shares',
                    hintStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (_) => calculateTotal(),
                ),
                const SizedBox(height: 14),
                Text(
                  'Purchase stock at a price',
                  style: AppTextStyle.inputTextHeadingText,
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: _priceController,
                  readOnly: true,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    hintText: '₹ 0.00',
                    prefix: Text(
                      '₹ ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Total Price',
                  style: AppTextStyle.inputTextHeadingText,
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: _totalPriceController,
                  readOnly: true,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    hintText: '₹ 0.00',
                    prefix: Text(
                      '₹ ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'ESG & Carbon Info',
                  style: AppTextStyle.subHeadingText,
                ),
                Container(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: isLoadingESG
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CO₂ Emissions: ${co2Emissions ?? '--'} tons/year',
                                  style: AppTextStyle.cardInfoText,
                                ),
                                const SizedBox(height: 4),
                                const Divider(
                                  color: Colors.grey,
                                ),
                                Text(
                                  'ESG Score: ${esgScore ?? '--'}',
                                  style: AppTextStyle.cardInfoText,
                                ),
                                const SizedBox(height: 4),
                                const Divider(
                                  color: Colors.grey,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Sustainability Rating:',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    const Icon(Icons.eco,
                                        color: Colors.green, size: 20),
                                    const SizedBox(width: 6),
                                    Text(
                                      '${sustainability ?? '--'}',
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: AppTextStyle.buttonText,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: isFormValid
                        ? () {
                            context.read<AddStockBloc>().add(
                                  AddStockToPortfolio(
                                    symbol: _symbolController.text,
                                    price: double.parse(_priceController.text),
                                    shares: int.parse(_sharesController.text),
                                  ),
                                );

                            final stock = DashboardStock(
                              symbol: _symbolController.text,
                              price: double.parse(_priceController.text),
                              shares: int.parse(_sharesController.text),
                              co2: co2Emissions ?? 0,
                              esg: (esgScore ?? 0).roundToDouble(),
                            );

                            context
                                .read<DashboardBloc>()
                                .add(AddStockToDashboard(stock));
                          }
                        : null,
                    child: Text(
                      'Add to Portfolio',
                      style: AppTextStyle.buttonText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
