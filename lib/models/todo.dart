import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final String id;
  final String title;
  final String? description;
  final bool isDone;
  final DateTime createdAt;
  Todo({
    required this.id,
    required this.title,
    this.description,

    required this.isDone,
    required this.createdAt,
  });
  factory Todo.fromMap(Map<String, dynamic> map, String id) => Todo(
    id: id,
    title: map['title'] ?? '',
    description: map['description'] ?? '',
    isDone: map['isDone'] ?? false,

    createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
  );
  Map<String, dynamic> toMap() => {
    'title': title,
    'description': description,
    'isDone': isDone,
    'createdAt': createdAt,
  };
}
