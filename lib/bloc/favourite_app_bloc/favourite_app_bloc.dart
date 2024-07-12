import 'package:bloc/bloc.dart';
import 'package:bloc_demo/bloc/favourite_app_bloc/favourite_app_events.dart';
import 'package:bloc_demo/bloc/favourite_app_bloc/favourite_app_states.dart';
import 'package:bloc_demo/model/favourite_item_model.dart';

import '../../repository/favourite_repository.dart';

class FavouriteBloc extends Bloc<FavouriteEvents, FavouriteItemStates> {
  List<FavouriteItemModel> favouriteList = [];

  FavouriteRepository favouriteRepository;
  FavouriteBloc(this.favouriteRepository) : super(const FavouriteItemStates()) {
    on<FetchFavouriteList>(fetchList);
  }

  void fetchList(FetchFavouriteList event, Emitter<FavouriteItemStates> emit) async {
    favouriteList = await favouriteRepository.fetchItem();
    emit(
      state.copyWith(favouriteItemList: List.from(favouriteList), listStatus: ListStatus.success),
    );
  }
}
