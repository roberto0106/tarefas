import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasklist/providers/task_provider.dart';
import 'package:tasklist/widgets/task_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Chamando fetchAndSetTasks aqui
    Provider.of<TaskProvider>(context, listen: false).fetchAndSetTasks();
  }

  @override
  Widget build(BuildContext context) {
    // Acesso ao provider
    var tasksProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.access_alarm),
          ),
        ],
      ),
      body: FutureBuilder(
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.error != null) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }
          return TaskList();
        },
      ),
    );
  }
}
