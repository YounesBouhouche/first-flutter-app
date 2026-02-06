import 'package:first_flutter_app/hive_functions.dart';
import 'package:first_flutter_app/presentation/todo.dart';
import 'package:first_flutter_app/presentation/util/add_todo_dialog.dart';
import 'package:first_flutter_app/presentation/util/todo_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = [];
  bool ascending = true;
  List<Todo> get sortedTodos {
    if (ascending) {
      return List.from(todos);
    } else {
      return todos.reversed.toList();
    }
  }

  void getTodos() {
    setState(() {
      todos = HiveFunctions.getTodos();
    });
  }

  void addTodo(String title) {
    HiveFunctions.createTodo(Todo(id: 0, title: title, isDone: false));
    getTodos();
  }

  void deleteTodo(int index) {
    HiveFunctions.delete(todos[index].id);
    getTodos();
  }

  void updateTodo(int index, String title) {
    final todo = todos[index];
    HiveFunctions.update(todo.id, todo.copyWith(title: title));
    getTodos();
  }

  void setDone(int index, bool? done) {
    if (done == null) return;
    final todo = todos[index];
    HiveFunctions.update(todo.id, todo.copyWith(isDone: done));
    getTodos();
  }

  @override
  void initState() {
    super.initState();
    getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        actions: [
          IconButton(
            icon: Icon(ascending ? Icons.arrow_upward : Icons.arrow_downward),
            onPressed: () {
              setState(() {
                ascending = !ascending;
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddTodoDialog(
              onConfirm: addTodo,
              onCancel: Navigator.of(context).pop,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: AnimatedList(
        key: UniqueKey(),
        initialItemCount: sortedTodos.length,
        itemBuilder: (context, index, animation) {
          final todo = sortedTodos[index];
          final realIndex = todos.indexOf(todo);
          return SizeTransition(
            sizeFactor: animation,
            child: TodoTile(
              title: todo.title,
              isDone: todo.isDone,
              onEdit: () {
                showDialog(
                  context: context,
                  builder: (context) => AddTodoDialog(
                    title: "Edit Todo",
                    initialValue: todo.title,
                    onConfirm: (text) => updateTodo(realIndex, text),
                    onCancel: Navigator.of(context).pop,
                  ),
                );
              },
              onDelete: () => deleteTodo(realIndex),
              onChangedDone: (done) => setDone(realIndex, done),
            ),
          );
        },
      ),
    );
  }
}
