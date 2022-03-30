import 'package:app_delivery/src/data/models/category.dart';
import 'package:app_delivery/src/data/models/dish.dart';
import 'package:app_delivery/src/data/repositories/food_menu_repository.dart';
import 'package:app_delivery/src/helpers/get.dart';
import 'package:flutter/widgets.dart';

class HomeTabController extends ChangeNotifier {
  final FoodMenuRepository _foodMenuRepository =
      Get.i.find<FoodMenuRepository>();

  final List<Category> categories = [
    Category(
      iconPath: "assets/pages/home/home_tab/breakfast.svg",
      label: "Breakfast",
    ),
    Category(
      iconPath: "assets/pages/home/home_tab/fries.svg",
      label: "Fast food",
    ),
    Category(
      iconPath: "assets/pages/home/home_tab/dinner.svg",
      label: "Dinner",
    ),
    Category(
      iconPath: "assets/pages/home/home_tab/dessert.svg",
      label: "Desserts",
    ),
  ];

  List<Dish> _popularMenu = [];
  List<Dish> get popularMenu => _popularMenu;

  //funcion que se ejecutará una sola vez cuando
  //nuestro home tap sea renderizado
  //y llamará la lista de platillos
  void afterFirstLayout() {
    _init();
  }

  void _init() async {
    _popularMenu = await _foodMenuRepository.getPopularMenu();
    notifyListeners();
  }
}
