import 'package:first_flutter_app/presentation/util/list_tile_shape.dart';
import 'package:first_flutter_app/presentation/util/setting_tile.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  Settings({super.key});
  final List<Widget> settings = [
    SettingTile(
      title: "Theme",
      subtitle: "Select app theme",
      onTap: () {},
      icon: Icons.palette,
      shape: listTileShape(0, 2),
    ),
    SettingTile(
      title: "Color Palette",
      subtitle: "Select app color palette",
      onTap: () {},
      icon: Icons.colorize,
      shape: listTileShape(1, 2),
    ),
    Divider(),
    SettingTile(
      title: "Language",
      subtitle: "Select app language",
      onTap: () {},
      icon: Icons.language,
      shape: listTileShape(0, 1),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView.separated(
        padding: EdgeInsets.all(12),
        itemCount: settings.length,
        itemBuilder: (context, index) => settings[index],
        separatorBuilder: (context, index) => const SizedBox(height: 6),
      ),
    );
  }
}
