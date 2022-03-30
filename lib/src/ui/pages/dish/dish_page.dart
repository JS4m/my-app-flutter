import 'package:app_delivery/src/ui/pages/dish/dish_controller.dart';
import 'package:app_delivery/src/ui/pages/dish/widgets/dish_header.dart';
import 'package:app_delivery/src/ui/pages/dish/widgets/dish_counter.dart';
import 'package:app_delivery/src/ui/pages/home/home_controller.dart';
import 'package:app_delivery/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import '../../../helpers/get.dart';
import '../../../utils/colors.dart';
import '../../global_widgets/rounded_button.dart';

class DishPage extends StatelessWidget {
  const DishPage({Key key}) : super(key: key);
  void _setStatusBar(bool light) {
    SystemChrome.setSystemUIOverlayStyle(
        light ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final homeController = Get.i.find<HomeController>();

        final DishPageArguments args =
            ModalRoute.of(context).settings.arguments;
        final isFavorite = homeController.isFavorite(args.dish);
        final controller = DishController(args, isFavorite);
        _setStatusBar(true);
        //para que cambie el color de la hora y la bateria a color blanco con el package Services.dark
        controller.onDispose = () => _setStatusBar(false);
        return controller;
      },
      child: Scaffold(
        //appBar: AppBar(),
        backgroundColor: Colors.white,
        floatingActionButton: RoundedButton(
          label: "Agregar al carrito",
          onPressed: () {},
          fullWidth: false,
          fontSize: 18,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DishHeader(),
                // SizedBox(height: 10),
                Builder(
                  builder: (_) {
                    final homeController = Get.i.find<HomeController>();
                    final controller = Provider.of<DishController>(_);
                    final dish = controller.dish;
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dish.name,
                                      style: FontStyles.title,
                                    ),
                                    Text(
                                      "\S/  ${dish.price}",
                                      style: FontStyles.regular.copyWith(
                                        fontSize: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              CupertinoButton(
                                padding: EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                  'assets/pages/home/favorite.svg',
                                  width: 35,
                                  height: 35,
                                  color: controller.isFavorite
                                      ? primaryColor
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  controller.toggleFavorite();
                                  homeController.toggleFavorite(dish);
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          DishCounter(
                            onChanged: controller.onCounterChanged,
                          ),
                          SizedBox(height: 20),
                          Text(
                            dish.description,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
