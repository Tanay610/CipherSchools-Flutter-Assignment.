import 'package:bloc/bloc.dart';
import 'package:cipher_school_app/models/expense_model.dart';
import 'package:flutter/material.dart';

part 'expense_state.dart';

class ExpenseCubit extends Cubit<List<ExpenseModel>> {
  ExpenseCubit() : super([]);

  void addExpense(String description, double amount, String category, String wallet,){
    final expense = ExpenseModel(id: DateTime.now().millisecondsSinceEpoch, description: description, amount: amount, category: category, wallet: wallet, time: DateTime.now());

    state.add(expense);
    emit([...state]);
  }

  void removeExpense(ExpenseModel expenseModel){
    emit(state.where((element)=> element!= expenseModel).toList());
  }
  


}



//
  // void todoMaker(String title){
  //   if (title.isEmpty) {
  //     addError("Title cant ever be empty.");
  //     return;
  //   }
  //   final todo = TodoList(name:title, createdAt: DateTime.now());

  //   state.add(todo);

  //   emit([...state]);
  // }

  // void removeTodo(TodoList todoList){
  //   emit(state.where((element) => element!= todoList).toList());

  // }