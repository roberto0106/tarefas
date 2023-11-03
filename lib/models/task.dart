class Task {
  final int id;
  final String title; // Mudança aqui
  bool completed;
  final int userId; // Adicionando userId
  final String obs;

  Task(
      {required this.id,
      required this.title, // Mudança aqui
      required this.completed,
      required this.userId, // Adicionando userId
      required this.obs});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        id: json['id'],
        title: json['title'], // Mudança aqui
        completed: json['completed'],
        userId: json['userId'], // Adicionando userId
        obs: "Observação sobre a tarefa");
  }
}
