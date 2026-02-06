import 'package:first_flutter_app/hive_box_const.dart';
import 'package:first_flutter_app/presentation/todo.dart';
import 'package:hive_flutter/adapters.dart';

class HiveFunctions {
  static final todoBox = Hive.box(todoHiveBox);

  static Future init() => Hive.openBox(todoHiveBox);

  static void createTodo(Todo data) async {
    int key = await todoBox.add(data);
    await todoBox.put(key, data.copyWith(id: key));
  }

  static List<Todo> getTodos() {
    final data = todoBox.keys.map((key) {
      final value = todoBox.get(key);
      return Todo(id: key, title: value.title, isDone: value.isDone);
    }).toList();

    return data.reversed.toList();
  }

  static void update(int key, Todo data) {
    todoBox.put(key, data);
  }

  static void delete(int key) {
    todoBox.delete(key);
  }

  static void deleteAll() {
    todoBox.deleteAll(todoBox.keys);
  }
}
