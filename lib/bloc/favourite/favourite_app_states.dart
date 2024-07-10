import 'package:equatable/equatable.dart';

import '../../model/favourite_item_model.dart';

class FavouriteAppStates extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final ListStatus listStatus;
  const FavouriteAppStates({
    this.favouriteItemList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavouriteAppStates copyWith({List<FavouriteItemModel>? favouriteItemList, ListStatus? listStatus}) {
    return FavouriteAppStates(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props => [favouriteItemList,listStatus];
}

enum ListStatus { loading, success, failure }
