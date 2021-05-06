import 'package:get_it/get_it.dart';
import 'package:todo_list/features/main/data/datasources/todo_data_sources.dart';
import 'package:todo_list/features/main/data/repositories/todo_repository.dart';
import 'package:todo_list/features/main/data/usecase/add_task_case.dart';
import 'package:todo_list/features/main/data/usecase/delete_task_case.dart';
import 'package:todo_list/features/main/data/usecase/done_task_case.dart';
import 'package:todo_list/features/main/data/usecase/get_todo_list_case.dart';
import 'package:todo_list/features/main/presentation/viewmodel/main_screen_view_model.dart';

final sl = GetIt.instance;

init() {
  /// Repository
  sl.registerLazySingleton<TodoDataSource>(() => TodoDataSourceImpl());
  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(todoDataSource: sl()));

  /// Use case
  sl.registerLazySingleton(() => GetTodoListCase(todoRepository: sl()));
  sl.registerLazySingleton(() => DoneTaskCase(todoRepository: sl()));
  sl.registerLazySingleton(() => AddTaskCase(todoRepository: sl()));
  sl.registerLazySingleton(() => DeleteTaskCase(todoRepository: sl()));

  /// View Model
  sl.registerLazySingleton<MainScreenViewModel>(
      () => MainScreenViewModel(getTodoListCase: sl(), doneTaskCase: sl(), addTaskCase: sl(), deleteTaskCase: sl()));
}
