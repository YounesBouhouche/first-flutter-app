import 'package:first_flutter_app/l10n/app_localizations.dart';
import 'package:first_flutter_app/presentation/pages/home/home.dart';
import 'package:first_flutter_app/presentation/pages/profile/profile.dart';
import 'package:first_flutter_app/presentation/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  Future<bool> _handleBackPress() async {
    final navigator = _navigatorKeys[_currentIndex].currentState;
    if (navigator != null && navigator.canPop()) {
      navigator.pop();
      return false;
    }
    if (_currentIndex != 0) {
      setState(() => _currentIndex = 0);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (await _handleBackPress()) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            _buildNavigator(0, const HomePage()),
            _buildNavigator(1, const Profile()),
            _buildNavigator(2, SettingsPage()),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          onDestinationSelected: (index) {
            setState(() => _currentIndex = index);
          },
          destinations: <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home),
              label: AppLocalizations.of(context)!.home,
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: AppLocalizations.of(context)!.profile,
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigator(int index, Widget home) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (state) => MaterialPageRoute(builder: (context) => home),
    );
  }
}
