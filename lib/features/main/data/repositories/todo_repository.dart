import 'package:todo_list/features/main/data/datasources/todo_data_sources.dart';
import 'package:todo_list/features/main/data/model/todo_item_model.dart';

abstract class TodoRepository {
  Future<List<TodoItemModel>> getTodoList();

  List<TodoItemModel> doneTask(List<TodoItemModel> list, int index);

  List<TodoItemModel> addTask(List<TodoItemModel> list, TodoItemModel itemModel);

  List<TodoItemModel> deleteTask(List<TodoItemModel> list, int index);
}

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource todoDataSource;

  const TodoRepositoryImpl({
    this.todoDataSource,
  });

  @override
  Future<List<TodoItemModel>> getTodoList() {
    return todoDataSource.getTodoList();
  }

  @override
  List<TodoItemModel> doneTask(List<TodoItemModel> list, int index) {
    return todoDataSource.doneTask(list, index);
  }

  @override
  List<TodoItemModel> addTask(List<TodoItemModel> list, TodoItemModel itemModel) {
    return todoDataSource.addTask(list, itemModel);
  }

  @override
  List<TodoItemModel> deleteTask(List<TodoItemModel> list, int index) {
    return todoDataSource.deleteTask(list, index);
  }
}
