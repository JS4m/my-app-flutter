import 'package:app_delivery/src/data/models/dish.dart';
import 'package:app_delivery/src/ui/pages/home/tabs/home_tab/widgets/dish_item.dart';
import 'package:app_delivery/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';

class HorizontalDishes extends StatelessWidget {
  final List<Dish> dishes;
  final String title;
  final VoidCallback onViewAll;
  const HorizontalDishes({
    Key key,
    @required this.dishes,
    @required this.title,
    this.onViewAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final width = MediaQuery.of(context).size.width * 0.6;
    return Container(
      height: 200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              //para poner el View all a la derecha
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: FontStyles.title,
                ),
                CupertinoButton(
                  padding: EdgeInsets.all(10),
                  minSize: 25,
                  child: Text("View All", style: FontStyles.regular),
                  onPressed: this.onViewAll,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final item = dishes[index];
                return DishHomeItem(
                  //esto es para que cada menu tenga keys unicos
                  key: UniqueKey(),
                  item: item,
                  isFirst: index == 0,
                );
              },
              itemCount: dishes.length,
            ),
          ),
        ],
      ),
    );
  }
}
