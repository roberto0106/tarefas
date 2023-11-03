import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasklist/providers/task_provider.dart';
import 'package:tasklist/widgets/task_item.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    // Acesso ao provider
    var tasksProvider = Provider.of<TaskProvider>(context);
    var tasks = tasksProvider.tasks;

    // Se não houver tarefas, mostre uma mensagem.
    if (tasks.isEmpty) {
      return const Center(
        child: Text('Nenhuma tarefa encontrada!'),
      );
    }

    // Renderize a lista de tarefas usando ListView.builder
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (ctx, index) {
        return TaskItem(task: tasks[index]);
      },
    );
  }
}
