part of 'dashboard_bloc.dart';

abstract class DashboardEvent {}

class AddStockToDashboard extends DashboardEvent {
  final DashboardStock stock;

  AddStockToDashboard(this.stock);
}
