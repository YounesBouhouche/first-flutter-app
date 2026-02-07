import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;
  final Function() onTap;
  final Widget? trailing;
  final Widget? bottom;
  final ShapeBorder? shape;

  const SettingTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.icon,
    this.trailing,
    this.shape,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        shape:
            shape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8.0,
          children: [
            Row(
              spacing: 12.0,
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    size: 24.0,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4.0,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                ?trailing,
              ],
            ),
            if (bottom != null) ...[const SizedBox(height: 8.0), bottom!],
          ],
        ),
      ),
    );
  }
}
