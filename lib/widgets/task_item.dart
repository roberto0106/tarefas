import 'package:flutter/material.dart';
import 'package:tasklist/app_theme.dart';
import 'package:tasklist/models/task.dart';
import 'package:tasklist/widgets/card.dart';

class TaskItem extends StatefulWidget {
  final Task task;

  const TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  Set<int> swipedTaskIds = {};

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: AppColors.lightOrange,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(
          right: 20.0,
        ),
        margin: const EdgeInsets.only(
          top: 10,
        ),
        child: const Icon(
          Icons.done,
          color: Colors.white,
        ),
      ),
      secondaryBackground: Container(
        color: AppColors.lightGreen,
      ),
      key: ValueKey(widget.task.id),
      onDismissed: (direction) {
        // Aqui, você deve remover o item da sua lista de tarefas.
        // Por exemplo:
        // tasks.remove(widget.task);
        // Verifique se a direção é para a direita
        if (direction == DismissDirection.endToStart) {
          setState(() {
            widget.task.completed = true; // Set 'completed' para true
            swipedTaskIds.add(widget.task.id); // Adicione o ID da tarefa ao Set
          });
        }

        // Mostre um feedback ao usuário, como um Snackbar:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${widget.task.title} foi atualizado!")),
        );
      },
      confirmDismiss: (direction) async {
        // Retorna false para evitar que o item seja removido
        return false;
      },
      child: CustomCard(
        color: widget.task.completed
            ? AppColors.primaryGreen
            : AppColors.primaryBlue,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    widget.task.completed ? Icons.done : Icons.pending,
                    color: Colors.white,
                    size: 50,
                  ),
                  const SizedBox(width: 10), // Espaçamento horizontal
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.task.title),
                      ],
                    ),
                  ),
                  Checkbox(
                    value: widget.task.completed,
                    onChanged: (bool? value) {
                      setState(() {
                        widget.task.completed = value!;
                      });
                    },
                  ),
                ],
              ),
              // Aqui você pode adicionar mais Rows ou outros widgets conforme necessário
              Divider(
                color: Colors.white,
              ),
              Row(
                children: [
                  Text(widget.task.obs),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
