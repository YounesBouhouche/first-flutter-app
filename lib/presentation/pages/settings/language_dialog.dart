import 'package:first_flutter_app/l10n/app_localizations.dart';
import 'package:first_flutter_app/presentation/util/list_tile_shape.dart';
import 'package:flutter/material.dart';

class LanguageDialog extends StatefulWidget {
  final String? selectedLanguage;
  const LanguageDialog({super.key, required this.selectedLanguage});

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  late String language = widget.selectedLanguage ?? "sys";

  @override
  Widget build(BuildContext context) {
    final languages = [
      {"code": "sys", "ref": AppLocalizations.of(context)!.system_default},
      {"code": "en", "ref": AppLocalizations.of(context)!.english},
      {"code": "fr", "ref": AppLocalizations.of(context)!.french},
      {"code": "ar", "ref": AppLocalizations.of(context)!.arabic},
    ];

    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.language),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: languages
            .map(
              (lang) => RadioGroup<String>(
                groupValue: language,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      language = value;
                    });
                  }
                },
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 2),
                  onTap: () => setState(() {
                    language = lang["code"]!;
                  }),
                  tileColor: language == lang["code"]
                      ? Theme.of(context).colorScheme.primary.withAlpha(25)
                      : Theme.of(context).colorScheme.surfaceContainerHighest,
                  shape: listTileShape(
                    languages.indexOf(lang),
                    languages.length,
                  ),
                  title: Row(
                    children: [
                      Radio<String>(value: lang["code"]!),
                      Text(lang["ref"]!),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(AppLocalizations.of(context)!.cancel),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(context, language);
          },
          child: Text(AppLocalizations.of(context)!.ok),
        ),
      ],
    );
  }
}
