import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasklist/providers/task_provider.dart';
import 'package:tasklist/screems/home_screen.dart';

import 'services/api_service.dart';
import 'app_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(
        apiService:
            ApiService(baseUrl: 'https://jsonplaceholder.typicode.com/todos/'),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      home: HomeScreen(),
    );
  }
}
