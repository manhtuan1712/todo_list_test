import 'package:todo_list/features/main/data/model/todo_item_model.dart';
import 'package:todo_list/features/main/data/repositories/todo_repository.dart';

class GetTodoListCase {
  final TodoRepository todoRepository;

  GetTodoListCase({
    this.todoRepository,
  });

  Future<List<TodoItemModel>> getTodoList() => todoRepository.getTodoList();
}
