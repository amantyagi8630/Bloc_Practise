import 'dart:io';

import 'package:bloc_demo/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:bloc_demo/bloc/image_picker_bloc/image_picker_event.dart';
import 'package:bloc_demo/bloc/image_picker_bloc/image_picker_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScrennState();
}

class _ImagePickerScrennState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Bloc'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerStates>(builder: (context, state) {
          return state.file == null
              ? GestureDetector(
                  onTap: () {
                    context.read<ImagePickerBloc>().add(CameraCapture());
                  },
                  child: const CircleAvatar(
                    child: Icon(Icons.camera, size: 50),
                  ),
                )
              : Image.file(File(state.file!.path.toString()));
        }),
      ),
    );
  }
}
