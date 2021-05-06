import 'package:todo_list/features/main/data/model/todo_item_model.dart';
import 'package:todo_list/features/main/data/repositories/todo_repository.dart';

class DeleteTaskCase {
  final TodoRepository todoRepository;

  DeleteTaskCase({
    this.todoRepository,
  });

  List<TodoItemModel> deleteTask(List<TodoItemModel> list, int index) => todoRepository.deleteTask(list, index);
}
