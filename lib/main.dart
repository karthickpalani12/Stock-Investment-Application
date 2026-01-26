import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_investments/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:stock_investments/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:stock_investments/features/stock_add/data/repositories/stock_repo_impl.dart';
import 'package:stock_investments/features/stock_add/domain/usecauses/get_stock_price_usecase.dart';
import 'package:stock_investments/features/stock_add/domain/usecauses/get_stock_info_usecase.dart';
import 'package:stock_investments/features/stock_add/presentation/bloc/add_stock_bloc.dart';
import 'package:stock_investments/features/stock_add/presentation/pages/stack_add_page.dart';
import 'package:stock_investments/navigation/app_routes.dart';
import 'package:stock_investments/theme/app_theme.dart';
import 'package:stock_investments/theme/theme_cubit.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => ThemeCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<DashboardBloc>(
              create: (_) => DashboardBloc(),
            ),
            BlocProvider<AddStockBloc>(
              create: (_) => AddStockBloc(
                GetStockPriceUseCase(StockRepositoryImpl()),
                GetStockInfoUseCase(StockRepositoryImpl()),
              ),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Stock Investments',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            initialRoute: AppRoutes.dashboard,
            routes: {
              AppRoutes.dashboard: (_) => const DashboardPage(),
              AppRoutes.addStock: (_) => const StockAddPage(),
            },
          ),
        );
      },
    );
  }
}
