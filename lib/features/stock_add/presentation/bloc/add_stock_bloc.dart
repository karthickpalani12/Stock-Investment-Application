import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_investments/features/stock_add/domain/usecauses/get_stock_info_usecase.dart';
import 'package:stock_investments/features/stock_add/domain/usecauses/get_stock_price_usecase.dart';
import 'package:stock_investments/features/stock_add/presentation/bloc/add_stock_event.dart';
import 'package:stock_investments/features/stock_add/presentation/bloc/add_stock_state.dart';

class AddStockBloc extends Bloc<AddStockEvent, AddStockState> {
  final GetStockPriceUseCase getStockPriceUseCase;
  final GetStockInfoUseCase getStockInfoUseCase;

  AddStockBloc(
    this.getStockPriceUseCase,
    this.getStockInfoUseCase,
  ) : super(AddStockState()) {
    on<SearchStockSelected>(_onStockSelected);
    on<AddStockToPortfolio>(_onAddStock);
  }

  Future<void> _onStockSelected(
      SearchStockSelected event, Emitter<AddStockState> emit) async {
    emit(state.copyWith(isLoading: true,status: AddStockStatus.loading));

    final stock = await getStockPriceUseCase(event.symbol);
    final info = await getStockInfoUseCase(event.symbol);

    emit(state.copyWith(
      symbol: stock.symbol,
      price: stock.price,
      co2: info.co2Emissions,
      esg: info.esgScore,
      isLoading: false,
      status: AddStockStatus.initial,
    ));
  }

  void _onAddStock(AddStockToPortfolio event, Emitter<AddStockState> emit) {
    emit(
      state.copyWith(
        status: AddStockStatus.success,
        message: '${event.symbol} added to portfolio successfully',
      ),
    );
  }
}
