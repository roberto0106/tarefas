import 'package:flutter/material.dart';
import 'package:tasklist/models/task.dart';
import 'package:tasklist/services/api_service.dart'; // Importe sua ApiService

class TaskProvider with ChangeNotifier {
  final ApiService apiService;

  List<Task> _tasks = [];
  List<Task> get tasks => [..._tasks];

  TaskProvider({required this.apiService});

  Future<void> fetchAndSetTasks() async {
    try {
      List<Task> loadedTasks = await apiService
          .fetchTasks(); // Alterando para fetchTasks e ajustando o tipo
      _tasks = loadedTasks;
      notifyListeners();
    } catch (error) {
      // Aqui você pode lidar com erros. Por exemplo, mostrando uma mensagem de erro para o usuário.
      print(error);
      throw error;
    }
  }

  // E outros métodos que você precisar...

}
