// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_list_todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseListTodoModel _$ResponseListTodoModelFromJson(
    Map<String, dynamic> json) {
  return ResponseListTodoModel(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : TodoItemModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseListTodoModelToJson(
        ResponseListTodoModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
