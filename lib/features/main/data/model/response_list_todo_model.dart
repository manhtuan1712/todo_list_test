import 'package:json_annotation/json_annotation.dart';
import 'package:todo_list/features/main/data/model/todo_item_model.dart';

part 'response_list_todo_model.g.dart';

@JsonSerializable()
class ResponseListTodoModel {
  final List<TodoItemModel> data;

  ResponseListTodoModel({
    this.data,
  });

  factory ResponseListTodoModel.fromJson(Map<String, dynamic> json) => _$ResponseListTodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseListTodoModelToJson(this);
}
