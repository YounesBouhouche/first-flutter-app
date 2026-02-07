import 'package:first_flutter_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  final GoRouterState state;
  const MainScreen({super.key, required this.child, required this.state});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = switch (widget.state.uri.toString()) {
      '/profile' => 1,
      '/settings' => 2,
      _ => 0,
    };

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (index) {
          setState(() => currentIndex = index);
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              widget.state.uri.toString() == '/'
                  ? context.push('/profile')
                  : context.pushReplacement('/profile');
              break;
            case 2:
              widget.state.uri.toString() == '/'
                  ? context.push('/settings')
                  : context.pushReplacement('/settings');
              break;
          }
        },
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: AppLocalizations.of(context)!.profile,
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: AppLocalizations.of(context)!.settings,
          ),
        ],
      ),
    );
  }
}
