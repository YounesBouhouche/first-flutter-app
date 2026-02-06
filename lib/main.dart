import 'package:dynamic_color/dynamic_color.dart';
import 'package:first_flutter_app/hive_functions.dart';
import 'package:first_flutter_app/presentation/main_screen.dart';
import 'package:first_flutter_app/presentation/todo.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoImplAdapter());
  await HiveFunctions.init();
  runApp(MyApp());
}

const _brandBlue = Color(0xFF1E88E5);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (lightDynamic != null && darkDynamic != null) {
          lightColorScheme = lightDynamic;
          darkColorScheme = darkDynamic;
        } else {
          lightColorScheme = ColorScheme.fromSeed(seedColor: _brandBlue);
          darkColorScheme = ColorScheme.fromSeed(seedColor: _brandBlue);
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(colorScheme: lightColorScheme, useMaterial3: true),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            useMaterial3: true,
          ),
          home: MainScreen(),
        );
      },
    );
  }
}
