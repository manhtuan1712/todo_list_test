import 'package:todo_list/features/main/data/model/todo_item_model.dart';
import 'package:todo_list/features/main/data/repositories/todo_repository.dart';

class AddTaskCase {
  final TodoRepository todoRepository;

  AddTaskCase({
    this.todoRepository,
  });

  List<TodoItemModel> addTask(List<TodoItemModel> list, TodoItemModel itemModel) =>
      todoRepository.addTask(list, itemModel);
}
