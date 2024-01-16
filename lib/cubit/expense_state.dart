part of 'expense_cubit.dart';

@immutable
sealed class ExpenseState {}

final class ExpenseInitial extends ExpenseState {}

final class ExpenseMaker extends ExpenseState{}

final class ExpenseRemover extends ExpenseState{
  final ExpenseModel expenseModel;

  ExpenseRemover({required this.expenseModel});

}
