import 'package:first_flutter_app/presentation/pages/home/home_content.dart';
import 'package:first_flutter_app/todo_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: TodoRepository.todoStream,
      builder: (context, snapshot) => snapshot.hasData
          ? HomeContent(todos: snapshot.data ?? [])
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
