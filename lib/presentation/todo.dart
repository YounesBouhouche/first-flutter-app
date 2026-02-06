import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@Freezed()
class Todo with _$Todo {
  @HiveType(typeId: 0)
  const factory Todo({
    @HiveField(0) required int id,
    @HiveField(1) required String title,
    @HiveField(2) required bool isDone,
  }) = _Todo;
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
