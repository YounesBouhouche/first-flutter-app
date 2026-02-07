import 'package:dynamic_color/dynamic_color.dart';
import 'package:first_flutter_app/presentation/pages/home/home.dart';
import 'package:first_flutter_app/presentation/pages/profile/profile.dart';
import 'package:first_flutter_app/presentation/pages/settings/settings_page.dart';
import 'package:first_flutter_app/presentation/pages/todos/todo_page.dart';
import 'package:first_flutter_app/todo_repository.dart';
import 'package:first_flutter_app/presentation/main_screen.dart';
import 'package:first_flutter_app/presentation/todo.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:first_flutter_app/data/settings.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

Future main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoImplAdapter());
  await TodoRepository.init();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(create: (_) => Settings(), child: const MyApp()),
  );
}

const _brandBlue = Color(0xFF1E88E5);

final routes = <RouteBase>[
  ShellRoute(
    builder: (context, state, child) => MainScreen(state: state, child: child),
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(
        path: '/todos/:id',
        builder: (context, state) {
          final id = int.tryParse(state.pathParameters['id'] ?? '');
          if (id == null) {
            return Scaffold(
              body: Center(child: Text('Invalid ID')),
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => context.pop(),
                ),
              ),
            );
          }
          return TodoPage(id: id);
        },
        name: "todo",
      ),
      GoRoute(path: '/profile', builder: (context, state) => const Profile()),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  ),
];

final router = GoRouter(routes: routes);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<Settings>(context);

    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (lightDynamic != null &&
            darkDynamic != null &&
            settings.dynamicColors) {
          lightColorScheme = lightDynamic;
          darkColorScheme = darkDynamic;
        } else {
          lightColorScheme = ColorScheme.fromSeed(seedColor: _brandBlue);
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: _brandBlue,
            brightness: Brightness.dark,
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(colorScheme: lightColorScheme, useMaterial3: true),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            useMaterial3: true,
          ),
          themeMode: settings.themeMode,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: settings.language == null ? null : Locale(settings.language!),
          home: Router(
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            backButtonDispatcher: router.backButtonDispatcher,
            restorationScopeId: 'router',
          ),
        );
      },
    );
  }
}
