import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stickyapp/helpers/consts.dart';
import 'package:stickyapp/providers/dark_model_provider.dart';
import 'package:stickyapp/providers/tasks_provider.dart';
import 'package:stickyapp/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TasksProvider>(create: (_) => TasksProvider()),

        ChangeNotifierProvider<DarkModelProvider>(
          create: (_) => DarkModelProvider()..initializeDarkMode(),
        ),
      ],
      child: Consumer<DarkModelProvider>(
        builder: (context, mode, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sticky App',
            theme: ThemeData(
              scaffoldBackgroundColor:
                  mode.isDark ? Colors.black : Colors.white,

              tabBarTheme: TabBarThemeData(
                labelStyle: TextStyle(
                  color: mode.isDark ? Colors.white : primaryColor,
                ),

                indicatorColor: mode.isDark ? Colors.white : primaryColor,
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),

              dialogTheme: DialogThemeData(
                backgroundColor: mode.isDark ? Colors.black : Colors.white,
              ),

              inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(),
                hintStyle: TextStyle(
                  color: mode.isDark ? Colors.white : Colors.black,
                ),
              ),

              appBarTheme: AppBarTheme(
                backgroundColor: mode.isDark ? Colors.black : Colors.white,
                titleTextStyle: TextStyle(
                  color: mode.isDark ? Colors.white : Colors.black,
                  fontSize: 22,
                ),
              ),
              textTheme: TextTheme(
                bodySmall: TextStyle(
                  color: mode.isDark ? Colors.white : Colors.black,
                ),
                bodyMedium: TextStyle(
                  color: mode.isDark ? Colors.white : Colors.black,
                ),
                bodyLarge: TextStyle(
                  color: mode.isDark ? Colors.white : Colors.black,
                ),

                titleSmall: TextStyle(
                  color: mode.isDark ? Colors.white : Colors.black,
                ),
                titleMedium: TextStyle(
                  color: mode.isDark ? Colors.white : Colors.black,
                ),
                titleLarge: TextStyle(
                  color: mode.isDark ? Colors.white : Colors.black,
                ),
                displaySmall: TextStyle(
                  color: mode.isDark ? Colors.white : Colors.black,
                ),
                displayMedium: TextStyle(
                  color: mode.isDark ? Colors.white : Colors.black,
                ),
                displayLarge: TextStyle(
                  color: mode.isDark ? Colors.white : Colors.black,
                ),
                headlineSmall: TextStyle(
                  color: mode.isDark ? Colors.white : Colors.black,
                ),
                headlineMedium: TextStyle(
                  color: mode.isDark ? Colors.white : Colors.black,
                ),
                headlineLarge: TextStyle(
                  color: mode.isDark ? Colors.white : Colors.black,
                ),
              ),
            ),

            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
