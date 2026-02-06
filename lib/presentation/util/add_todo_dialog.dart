import 'package:flutter/material.dart';

class AddTodoDialog extends StatefulWidget {
  final String title;
  final String initialValue;
  final Function(String title) onConfirm;
  final Function() onCancel;
  const AddTodoDialog({
    this.title = "Add Todo",
    this.initialValue = "",
    required this.onConfirm,
    required this.onCancel,
    super.key,
  });

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: widget.initialValue);
    String? error;

    return AlertDialog(
      title: Text(widget.title, textAlign: TextAlign.center),
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      actions: [
        OutlinedButton(onPressed: widget.onCancel, child: const Text("Cancel")),
        FilledButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              widget.onConfirm(controller.text);
              Navigator.of(context).pop();
            } else {
              setState(() {
                error = "Title can't be empty";
              });
            }
          },
          child: const Text("Add Todo"),
        ),
      ],
      actionsAlignment: MainAxisAlignment.spaceBetween,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 2.0,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter Todo Title",
              errorText: error,
            ),
          ),
        ],
      ),
    );
  }
}
