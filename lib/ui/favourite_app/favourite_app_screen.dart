import 'dart:ffi';

import 'package:bloc_demo/bloc/favourite_app_bloc/favourite_app_bloc.dart';
import 'package:bloc_demo/bloc/favourite_app_bloc/favourite_app_events.dart';
import 'package:bloc_demo/bloc/favourite_app_bloc/favourite_app_states.dart';
import 'package:bloc_demo/repository/favourite_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppScreen extends StatelessWidget {
  const FavouriteAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => FavouriteBloc(FavouriteRepository())..add(FetchFavouriteList()),
        child: BlocBuilder<FavouriteBloc, FavouriteItemStates>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case ListStatus.success:
                return ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: state.favouriteItemList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(state.favouriteItemList[index].value.toString()),
                      ),
                    );
                  },
                );
              case ListStatus.failure:
                return const Text('Something Went Wrong');
            }
          },
        ),
      ),
    );
  }
}
