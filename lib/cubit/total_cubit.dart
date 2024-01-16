
import 'package:bloc/bloc.dart';

class TotalCubit extends Cubit<TotalAmount> {
  TotalCubit() : super(TotalAmount(totalIncome: 0, totalExpense: 0, ));

  void addIncome(double amount) {
    emit(state.copyWith(totalIncome: state.totalIncome + amount));
  }

  void addExpense(double amount) {
    emit(state.copyWith(totalExpense: state.totalExpense + amount));
  }
}

class TotalAmount {
  final double totalIncome;
  final double totalExpense;

  TotalAmount({required this.totalIncome, required this.totalExpense});

  TotalAmount copyWith({double? totalIncome, double? totalExpense}) {
    return TotalAmount(
      totalIncome: totalIncome ?? this.totalIncome,
      totalExpense: totalExpense ?? this.totalExpense,
    );
  }
}
