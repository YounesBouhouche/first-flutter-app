import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;
  final Function() onTap;
  final Widget? trailing;
  final ShapeBorder? shape;

  const SettingTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.icon,
    this.trailing,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
      leading: icon != null ? Icon(icon) : null,
      trailing: trailing,
      shape:
          shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      tileColor: Theme.of(context).colorScheme.surfaceContainer,
    );
  }
}
