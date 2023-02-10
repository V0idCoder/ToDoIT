class Task {
  final String? id;
  final String title;
  final String description;
  final DateTime? date;
  bool isChecked;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.isChecked,
  });

  factory Task.base() {
    return Task(
      id: null,
      title: '',
      description: '',
      date: null,
      isChecked: false,
    );
  }
  Task copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? date,
    bool? isChecked,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  String toString() {
    return "{\n\tid: $id\n\ttitle: $title\n\tdescription: $description\n\tdate: $date}\n\tisChecked: $isChecked";
  }
}
