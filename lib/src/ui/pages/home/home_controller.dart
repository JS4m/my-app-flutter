import 'package:app_delivery/src/data/models/dish.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';

class HomeController extends ChangeNotifier implements TickerProvider {
  int _currentPage = 0;
  int get currentPage => _currentPage;
  void setPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  Map<int, Dish> _favorites = {};
  Map<int, Dish> get favorites => _favorites;
  bool isFavorite(Dish dish) => _favorites.containsKey(dish.id);

  void Function() onDispose;

  HomeController() {
    _init();
  }

  TabController tabController;

  void _init() {
    tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  void afterFirstLayout() {
    this.tabController.addListener(() {
      _currentPage = tabController.index;
      notifyListeners();
    });
  }

  void toggleFavorite(Dish dish) {
    Map<int, Dish> copy = Map<int, Dish>.from(_favorites);
    if (isFavorite(dish)) {
      copy.remove(dish.id);
    } else {
      copy[dish.id] = dish;
    }
    _favorites = copy;
    notifyListeners();
  }

  //eso es para que se actualice  el current page
  @override
  void dispose() {
    tabController.dispose();
    if (this.onDispose != null) {
      this.onDispose();
    }
    super.dispose();
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
