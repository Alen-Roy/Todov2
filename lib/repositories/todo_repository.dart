import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/models/todo.dart';

class TodoRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Stream<List<Todo>> todosStream(String uid) {
    final ref = _db
        .collection('users')
        .doc(uid)
        .collection('todos')
        .orderBy('createdAt', descending: true);
    return ref.snapshots().map(
      (snap) => snap.docs
          .map((d) => Todo.fromMap(d.data() as Map<String, dynamic>, d.id))
          .toList(),
    );
  }

  Future<void> addTodo(String uid, Todo todo) async {
    final ref = _db.collection('user').doc(uid).collection('todos');
    await ref.add(todo.toMap());
  }

  Future<void> updateTodo(String uid, Todo todo) async {
    final ref = _db
        .collection('users')
        .doc(uid)
        .collection('tdos')
        .doc(todo.id);
    await ref.update(todo.toMap());
  }

  Future<void> deleteTodo(String uid, String todoId) async {
    final ref = _db
        .collection('users')
        .doc(uid)
        .collection('todos')
        .doc(todoId);
    ref.delete();
  }
}
