import 'package:equatable/equatable.dart';

import '../../model/favourite_item_model.dart';

class FavouriteItemStates extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final ListStatus listStatus;
  const FavouriteItemStates({
    this.favouriteItemList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavouriteItemStates copyWith({List<FavouriteItemModel>? favouriteItemList, ListStatus? listStatus}) {
    return FavouriteItemStates(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props => [favouriteItemList, listStatus];
}

enum ListStatus { loading, success, failure }
