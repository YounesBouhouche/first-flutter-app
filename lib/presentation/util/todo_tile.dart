import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function()? onEdit;
  final Function(bool?)? onChangedDone;
  final Function() onDelete;

  const TodoTile({
    super.key,
    required this.title,
    required this.isDone,
    this.onEdit,
    this.onChangedDone,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(title),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => onDelete(),
      background: Container(
        color: Theme.of(context).colorScheme.errorContainer,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16.0),
        child: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
      ),
      child: ListTile(
        leading: Checkbox(value: isDone, onChanged: onChangedDone),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        title: Text(
          title,
          style: TextStyle(
            decoration: isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        contentPadding: const EdgeInsets.all(8.0),
        onTap: onEdit,
      ),
    );
  }
}
