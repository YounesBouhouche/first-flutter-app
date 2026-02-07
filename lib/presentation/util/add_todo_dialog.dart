import 'package:first_flutter_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AddTodoDialog extends StatefulWidget {
  final String title;
  final String initialValue;
  final Function(String title) onConfirm;
  final Function() onCancel;
  const AddTodoDialog({
    required this.title,
    this.initialValue = "",
    required this.onConfirm,
    required this.onCancel,
    super.key,
  });

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  String? error;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: widget.initialValue);

    return AlertDialog(
      title: Text(widget.title, textAlign: TextAlign.center),
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      actions: [
        OutlinedButton(
          onPressed: widget.onCancel,
          child: Text(AppLocalizations.of(context)!.cancel),
        ),
        FilledButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              widget.onConfirm(controller.text);
              Navigator.of(context).pop();
            } else {
              setState(() {
                error = AppLocalizations.of(context)!.title_cant_be_empty;
              });
            }
          },
          child: Text(AppLocalizations.of(context)!.save),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: AppLocalizations.of(context)!.title,
              errorText: error,
            ),
          ),
        ],
      ),
    );
  }
}
