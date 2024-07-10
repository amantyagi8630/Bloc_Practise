import 'package:bloc_demo/bloc/todo/todo_event.dart';
import 'package:bloc_demo/bloc/todo/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoBloc extends Bloc<ToDoEvents, ToDoState> {
  final List<String> todosList = [];
  ToDoBloc() : super(const ToDoState()) {
    on<AddToDoEvent>(_addToDoEvent);
    on<RemoveToDoEvent>(_removeToDoEvent);
  }

  void _addToDoEvent(AddToDoEvent event, Emitter<ToDoState> emit) {
    todosList.add(event.task);
    emit(state.copyWith(todosList: List.from(todosList)));
  }

  void _removeToDoEvent(RemoveToDoEvent event, Emitter<ToDoState> emit) {
    todosList.remove(event.task);
    emit(state.copyWith(todosList: List.from(todosList)));
  }
}
