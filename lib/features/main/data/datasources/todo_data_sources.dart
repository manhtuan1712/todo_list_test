import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:todo_list/features/main/data/model/response_list_todo_model.dart';
import 'package:todo_list/features/main/data/model/todo_item_model.dart';

abstract class TodoDataSource {
  Future<List<TodoItemModel>> getTodoList();

  List<TodoItemModel> doneTask(List<TodoItemModel> list, int index);

  List<TodoItemModel> addTask(List<TodoItemModel> list, TodoItemModel itemModel);

  List<TodoItemModel> deleteTask(List<TodoItemModel> list, int index);
}

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<List<TodoItemModel>> getTodoList() async {
    String data = await rootBundle.loadString("assets/json/data.json");
    return ResponseListTodoModel.fromJson(jsonDecode(data)).data;
  }

  @override
  List<TodoItemModel> doneTask(List<TodoItemModel> list, int index) {
    list[index].isDone = !list[index].isDone;
    return list;
  }

  @override
  List<TodoItemModel> addTask(List<TodoItemModel> list, TodoItemModel itemModel) {
    list.add(itemModel);
    return list;
  }

  @override
  List<TodoItemModel> deleteTask(List<TodoItemModel> list, int index) {
    list.removeAt(index);
    return list;
  }
}
