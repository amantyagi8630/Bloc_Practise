import 'package:bloc/bloc.dart';
import 'package:bloc_demo/bloc/favourite/favourite_app_events.dart';
import 'package:bloc_demo/bloc/favourite/favourite_app_states.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvents, FavouriteAppStates> {
  FavouriteAppBloc() : super(FavouriteAppStates());
}
