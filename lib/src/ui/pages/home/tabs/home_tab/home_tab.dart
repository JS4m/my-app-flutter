import 'package:app_delivery/src/data/models/dish.dart';
import 'package:app_delivery/src/ui/pages/home/tabs/home_tab/home_tab_controller.dart';
import 'package:app_delivery/src/ui/pages/home/tabs/home_tab/widgets/categories_menu.dart';
import 'package:app_delivery/src/ui/pages/home/tabs/home_tab/widgets/horizontal_dishes.dart';
import 'package:app_delivery/src/ui/pages/home/tabs/home_tab/widgets/search_button.dart';
import 'package:app_delivery/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key key}) : super(key: key);
  @override
  State<HomeTab> createState() => _HomeTabState();
}

//PARA PRESERVAR EL ESTADO DE LA PESTAÑA
//cuando usas AutomaticKeepAliveClientMixin debes sobre escribir el @override de _HomeTabState
class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    //y añadir el super.build
    super.build(context);

    return ChangeNotifierProvider<HomeTabController>(
      create: (_) {
        final controller = HomeTabController();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.afterFirstLayout();
        });
        return controller;
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        //color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  //esto es para que el texto top se alinea a la izquierda con .start
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hola,Sam"),
                    Text(
                      "Lorem ipsum dolor sit amet",
                      style: FontStyles.title.copyWith(fontSize: 25),
                    ),
                    SizedBox(height: 10),
                    SearchButton(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              CategoriesMenu(),
              SizedBox(height: 20),
              //este builder es el menu popular de platillos
              Builder(
                builder: (context) {
                  final List<Dish> popularMenu =
                      context.select<HomeTabController, List<Dish>>(
                    (_) => _.popularMenu,
                  );
                  return HorizontalDishes(
                    dishes: popularMenu,
                    title: "Popular Menú",
                    onViewAll: () {},
                  );
                },
              ),
              Builder(
                builder: (context) {
                  final List<Dish> popularMenu =
                      context.select<HomeTabController, List<Dish>>(
                    (_) => _.popularMenu,
                  );
                  return HorizontalDishes(
                    dishes: popularMenu,
                    title: "Popular Menú",
                    onViewAll: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //aqui preservamos el estado de nuestro scroll bar cuando cambiemos de pestaña
  @override
  bool get wantKeepAlive => true;
}
