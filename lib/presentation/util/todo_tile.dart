import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TodoTile extends StatelessWidget {
  final int id;
  final String title;
  final bool isDone;
  final Function()? onEdit;
  final Function(bool?)? onChangedDone;
  final Function() onDelete;
  final ShapeBorder? shape;

  const TodoTile({
    super.key,
    required this.id,
    required this.title,
    required this.isDone,
    this.onEdit,
    this.onChangedDone,
    required this.onDelete,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    final tileShape =
        shape ??
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0));
    return Dismissible(
      key: ValueKey(title),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => onDelete(),
      background: Container(
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.errorContainer,
          shape: tileShape,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16.0),
        child: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
      ),
      child: ListTile(
        leading: Checkbox(value: isDone, onChanged: onChangedDone),
        shape: tileShape,
        tileColor: isDone
            ? Theme.of(context).colorScheme.primary.withAlpha(25)
            : Theme.of(context).colorScheme.surfaceContainerLow,
        title: Hero(
          tag: 'todo_$id',
          child: Text(
            title,
            style: TextStyle(
              decoration: isDone ? TextDecoration.lineThrough : null,
              color: isDone
                  ? Theme.of(
                      context,
                    ).colorScheme.onPrimaryContainer.withAlpha(150)
                  : null,
            ),
          ),
        ),
        contentPadding: const EdgeInsets.all(8.0),
        onLongPress: onEdit,
        onTap: () =>
            context.pushNamed("todo", pathParameters: {"id": id.toString()}),
      ),
    );
  }
}
