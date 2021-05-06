import 'package:json_annotation/json_annotation.dart';

part 'todo_item_model.g.dart';

@JsonSerializable()
class TodoItemModel {
  int id;

  String title;

  bool isDone;

  TodoItemModel({
    this.id,
    this.title,
    this.isDone,
  });

  factory TodoItemModel.fromJson(Map<String, dynamic> json) => _$TodoItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoItemModelToJson(this);
}
