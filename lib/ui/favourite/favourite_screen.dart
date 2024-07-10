import 'package:flutter/material.dart';

class FavouriteAppScreen extends StatelessWidget {
  const FavouriteAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        centerTitle: true,
      ),
    );
  }
}
