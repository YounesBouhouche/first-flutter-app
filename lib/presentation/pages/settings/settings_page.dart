import 'package:first_flutter_app/data/settings.dart';
import 'package:first_flutter_app/l10n/app_localizations.dart';
import 'package:first_flutter_app/presentation/pages/settings/language_dialog.dart';
import 'package:first_flutter_app/presentation/util/list_tile_shape.dart';
import 'package:first_flutter_app/presentation/util/setting_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  List<Widget> getSettingsTiles(BuildContext context) {
    final settings = Provider.of<Settings>(context);
    return [
      SettingTile(
        title: AppLocalizations.of(context)!.theme,
        subtitle: AppLocalizations.of(context)!.theme_description,
        onTap: () {},
        icon: Icons.palette,
        shape: listTileShape(0, 2),
        bottom: SegmentedButton<ThemeMode>(
          selected: <ThemeMode>{settings.themeMode},
          segments: [
            ButtonSegment(
              value: ThemeMode.system,
              label: Text(
                AppLocalizations.of(context)!.system_default,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ButtonSegment(
              value: ThemeMode.light,
              label: Text(
                AppLocalizations.of(context)!.light,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ButtonSegment(
              value: ThemeMode.dark,
              label: Text(
                AppLocalizations.of(context)!.dark,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
          onSelectionChanged: (value) {
            settings.updateThemeMode(value.first);
          },
        ),
      ),
      SettingTile(
        title: AppLocalizations.of(context)!.dynamic_colors,
        subtitle: AppLocalizations.of(context)!.dynamic_colors_description,
        onTap: () {
          settings.updateDynamicColors(!settings.dynamicColors);
        },
        icon: Icons.colorize,
        shape: listTileShape(1, 2),
        trailing: Switch(
          value: settings.dynamicColors,
          onChanged: (value) {
            settings.updateDynamicColors(value);
          },
        ),
      ),
      Divider(),
      SettingTile(
        title: AppLocalizations.of(context)!.language,
        subtitle: AppLocalizations.of(context)!.language_description,
        onTap: () {
          showDialog(
            context: context,
            builder: (context) =>
                LanguageDialog(selectedLanguage: settings.language),
          ).then((value) {
            if (value != null) {
              settings.updateLanguage(value == "sys" ? null : value);
            }
          });
        },
        icon: Icons.language,
        shape: listTileShape(0, 1),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final settingsTiles = getSettingsTiles(context);
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settings)),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView.separated(
        padding: EdgeInsets.all(12),
        itemCount: settingsTiles.length,
        itemBuilder: (context, index) => settingsTiles[index],
        separatorBuilder: (context, index) => const SizedBox(height: 6),
      ),
    );
  }
}
