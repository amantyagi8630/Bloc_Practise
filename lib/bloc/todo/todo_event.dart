import 'package:equatable/equatable.dart';

abstract class ToDoEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddToDoEvent extends ToDoEvents {
  final String task;
  AddToDoEvent({required this.task});
  @override
  List<Object?> get props => [task];
}

class RemoveToDoEvent extends ToDoEvents {
  final Object task;
  RemoveToDoEvent({required this.task});
  @override
  List<Object?> get props => [task];
}
