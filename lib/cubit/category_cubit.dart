import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<List<Map<String, dynamic>>> {
  CategoryCubit() : super([]);


  void selectCategory( IconData imagePath, Color color) {
    final newTile ={
      'imagePath': imagePath,
      'color': color,
    };
    

    final updatedList = List<Map<String, dynamic>>.from(state)..add(newTile);

    emit(updatedList);
  }
}
