import 'package:dynamic_color/dynamic_color.dart';
import 'package:first_flutter_app/todo_repository.dart';
import 'package:first_flutter_app/presentation/main_screen.dart';
import 'package:first_flutter_app/presentation/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:first_flutter_app/data/settings.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localizations.dart';

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
          home: MainScreen(),
        );
      },
    );
  }
}
