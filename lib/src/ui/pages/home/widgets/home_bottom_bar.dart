import 'package:app_delivery/src/ui/pages/home/home_controller.dart';
import 'package:app_delivery/src/ui/pages/home/widgets/home_indicator.dart';
import 'package:app_delivery/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeBottomBar extends StatelessWidget {
  HomeBottomBar({Key key}) : super(key: key);

  final List<_BottomBarItem> _items = [
    _BottomBarItem(
      icon: 'assets/pages/home/home.svg',
      //label: 'Inicio',
    ),
    _BottomBarItem(
      icon: 'assets/pages/home/favorite.svg',
      //label: 'Favoritos',
    ),
    _BottomBarItem(
      icon: 'assets/pages/home/bell.svg',
      //label: 'Notificaciones',
    ),
    _BottomBarItem(
      icon: 'assets/pages/home/avatar.svg',
      //label: 'Perfil',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //listen false , para que cada vez que llame a notifier listener , no se renderize de forma innecesaria el widget home botom bar
    final controller = Provider.of<HomeController>(context, listen: false);
    final int currentPage =
        context.select<HomeController, int>((_) => _.currentPage);

    return Container(
      child: SafeArea(
        top: false,
        child: TabBar(
          controller: controller.tabController,
          indicator: HomeTabBarIndicator(),
          tabs: List.generate(
            _items.length,
            (index) {
              final item = _items[index];
              return BottomBarTab(
                item: item,
                isActive: currentPage == index,
              );
            },
          ),
        ),
      ),
    );
  }
}

class BottomBarTab extends StatelessWidget {
  const BottomBarTab({
    Key key,
    @required this.item,
    @required this.isActive,
  }) : super(key: key);

  final _BottomBarItem item;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    //aca definimos si el color activo es verdadero , primary color ,si no ,es negro
    final Color color = this.isActive ? primaryColor : Colors.black;
    return Tab(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          item.icon,
          color: color,
        ),
      ),
    );
  }
}

class _BottomBarItem {
  final String icon, label;

  _BottomBarItem({
    @required this.icon,
    @required this.label,
  });
}
