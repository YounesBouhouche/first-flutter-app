import 'package:first_flutter_app/l10n/app_localizations.dart';
import 'package:first_flutter_app/presentation/todo.dart';
import 'package:first_flutter_app/presentation/util/add_todo_dialog.dart';
import 'package:first_flutter_app/presentation/util/todo_tile.dart';
import 'package:first_flutter_app/todo_repository.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  final List<Todo> todos;
  const HomeContent({super.key, required this.todos});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool ascending = true;

  List<Todo> get sortedTodos {
    if (ascending) {
      return List.from(widget.todos);
    } else {
      return widget.todos.reversed.toList();
    }
  }

  void addTodo(String title) {
    TodoRepository.createTodo(Todo(id: 0, title: title, isDone: false));
  }

  void deleteTodo(int index) {
    TodoRepository.delete(widget.todos[index].id);
  }

  void updateTodo(int index, String title) {
    final todo = widget.todos[index];
    TodoRepository.update(todo.id, todo.copyWith(title: title));
  }

  void setDone(int index, bool? done) {
    if (done == null) return;
    final todo = widget.todos[index];
    TodoRepository.update(todo.id, todo.copyWith(isDone: done));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.todo_list),
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
              title: AppLocalizations.of(context)!.add_todo,
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
          final realIndex = widget.todos.indexOf(todo);
          return SizeTransition(
            sizeFactor: animation,
            child: TodoTile(
              title: todo.title,
              isDone: todo.isDone,
              onEdit: () {
                showDialog(
                  context: context,
                  builder: (context) => AddTodoDialog(
                    title: AppLocalizations.of(context)!.edit_todo,
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
