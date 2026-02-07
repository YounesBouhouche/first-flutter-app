import 'package:first_flutter_app/l10n/app_localizations.dart';
import 'package:first_flutter_app/presentation/todo.dart';
import 'package:first_flutter_app/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TodoPage extends StatelessWidget {
  final int id;
  const TodoPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final todoStream = TodoRepository.getTodoById(id);

    if (todoStream == null) {
      return Scaffold(
        body: Center(child: Text(AppLocalizations.of(context)!.todo_not_found)),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      );
    } else {
      return StreamBuilder<Todo>(
        stream: todoStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            );
          }

          final todo = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text(todo.title),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.pop(),
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                TodoRepository.update(id, todo.copyWith(isDone: !todo.isDone));
              },
              label: Text(
                todo.isDone
                    ? AppLocalizations.of(context)!.mark_as_undone
                    : AppLocalizations.of(context)!.mark_as_done,
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.id_param(todo.id)),
                  SizedBox(height: 8),
                  Text(AppLocalizations.of(context)!.title_param(todo.title)),
                  SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)!.status_param(
                      todo.isDone
                          ? AppLocalizations.of(context)!.done
                          : AppLocalizations.of(context)!.undone,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
