import 'package:bloc_demo/bloc/todo/todo_bloc.dart';
import 'package:bloc_demo/bloc/todo/todo_event.dart';
import 'package:bloc_demo/bloc/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo Screen'),
        centerTitle: true,
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if (state.todosList.isEmpty) {
            return const Center(
              child: Text('No todo found'),
            );
          } else if (state.todosList.isNotEmpty) {
            return ListView.builder(
                itemCount: state.todosList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      state.todosList[index].toString(),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<ToDoBloc>().add(RemoveToDoEvent(task: state.todosList[index]));
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  );
                });
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            context.read<ToDoBloc>().add(AddToDoEvent(task: 'Task: $i'));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
