import 'package:todo_list/features/main/data/model/todo_item_model.dart';
import 'package:todo_list/features/main/data/repositories/todo_repository.dart';

class DoneTaskCase {
  final TodoRepository todoRepository;

  DoneTaskCase({
    this.todoRepository,
  });

  List<TodoItemModel> doneTask(List<TodoItemModel> list, int index) => todoRepository.doneTask(list, index);
}
