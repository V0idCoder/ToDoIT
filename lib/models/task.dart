class Task {
  final String? id;
  final String title;
  final String description;
  final DateTime? date;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  factory Task.base() {
    return Task(
      id: null,
      title: '',
      description: '',
      date: null,
    );
  }
  Task copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? date,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }

  @override
  String toString() {
    return "{\n\tid: $id\n\ttitle: $title\n\tdescription: $description\n\tdate: $date}";
  }
}
