import 'package:flutter/cupertino.dart';
import 'package:todo_list/features/main/data/model/todo_item_model.dart';
import 'package:todo_list/features/main/data/usecase/add_task_case.dart';
import 'package:todo_list/features/main/data/usecase/delete_task_case.dart';
import 'package:todo_list/features/main/data/usecase/done_task_case.dart';
import 'package:todo_list/features/main/data/usecase/get_todo_list_case.dart';

class MainScreenViewModel extends ChangeNotifier {
  final GetTodoListCase getTodoListCase;

  final DoneTaskCase doneTaskCase;

  final AddTaskCase addTaskCase;

  final DeleteTaskCase deleteTaskCase;

  MainScreenViewModel({
    this.getTodoListCase,
    this.doneTaskCase,
    this.addTaskCase,
    this.deleteTaskCase,
  });

  List<TodoItemModel> _listItemTodo = [];

  List<TodoItemModel> get listItemTodo => _listItemTodo;

  void getTodoList() async {
    _listItemTodo = await getTodoListCase.getTodoList();
    notifyListeners();
  }

  void doneTask(int index) {
    _listItemTodo = doneTaskCase.doneTask(_listItemTodo, index);
    notifyListeners();
  }

  void addTask(TodoItemModel itemModel) {
    _listItemTodo = addTaskCase.addTask(_listItemTodo, itemModel);
    notifyListeners();
  }

  void deleteTask(int index) {
    _listItemTodo = deleteTaskCase.deleteTask(_listItemTodo, index);
    notifyListeners();
  }
}
