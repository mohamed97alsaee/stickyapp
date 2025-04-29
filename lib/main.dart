import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stickyapp/helpers/consts.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sticky App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
