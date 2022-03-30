import 'package:app_delivery/src/data/models/dish.dart';
import 'package:app_delivery/src/ui/pages/home/tabs/favorites_tab/widgets/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home_controller.dart';

class FavoritesTab extends StatefulWidget {
  const FavoritesTab({Key key}) : super(key: key);

  @override
  _FavoritesTabState createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final favorites = context
        .select<HomeController, Map<int, Dish>>((_) => _.favorites)
        .values
        .toList();

    return ListView.builder(
      itemBuilder: (_, index) => FavoriteItem(
        dish: favorites[index],
      ),
      itemCount: favorites.length,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
