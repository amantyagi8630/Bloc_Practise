import 'package:bloc_demo/bloc/favourite_app_bloc/favourite_app_bloc.dart';
import 'package:bloc_demo/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:bloc_demo/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_demo/bloc/todo/todo_bloc.dart';
import 'package:bloc_demo/repository/favourite_repository.dart';
import 'package:bloc_demo/ui/favourite_app/favourite_app_screen.dart';
import 'package:bloc_demo/utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => ToDoBloc()),
        BlocProvider(create: (_) => FavouriteBloc(FavouriteRepository())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        home: FavouriteAppScreen(),
      ),
    );
  }
}