// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoItemModel _$TodoItemModelFromJson(Map<String, dynamic> json) {
  return TodoItemModel(
    id: json['id'] as int,
    title: json['title'] as String,
    isDone: json['isDone'] as bool,
  );
}

Map<String, dynamic> _$TodoItemModelToJson(TodoItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isDone': instance.isDone,
    };
