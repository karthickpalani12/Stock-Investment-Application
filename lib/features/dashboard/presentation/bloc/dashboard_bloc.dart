import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/dashboard_stock.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState.initial()) {
    on<AddStockToDashboard>(_onAddStock);
  }

  void _onAddStock(
    AddStockToDashboard event,
    Emitter<DashboardState> emit,
  ) {
    final updatedStocks = List<DashboardStock>.from(state.stocks)
      ..add(event.stock);

    final totalValue = updatedStocks.fold<double>(
      0,
      (sum, stock) => sum + stock.totalValue,
    );

    final totalCo2 = updatedStocks.fold<double>(
      0,
      (sum, stock) => sum + stock.co2,
    );

    final greenScore = updatedStocks.isEmpty
        ? 0
        : (updatedStocks.fold<double>(
                  0,
                  (sum, stock) => sum + stock.esg.toDouble(),
                ) /
                updatedStocks.length)
            .round();

    emit(
      state.copyWith(
        stocks: updatedStocks,
        totalValue: totalValue,
        totalCo2: totalCo2,
        greenScore: greenScore,
      ),
    );
  }
}
