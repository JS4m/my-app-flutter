import 'package:app_delivery/src/data/models/onboard_item.dart';
import 'package:flutter/widgets.dart';

class OnboardController extends ChangeNotifier {
  final List<OnboardItem> items = [
    OnboardItem(
      image: "assets/pages/onboard/slider1.svg",
      title: "Control de Asistencia de Miembros",
      description:
          "Se puede registrar la asistencia de los miembros de Mahanaim Campamento de Dios.",
    ),
    OnboardItem(
      image: "assets/pages/onboard/slider2.svg",
      title: "Registro de Eventos",
      description:
          "Se puede registrar los eventos de Mahanaim Campamento de Dios.",
    ),
    OnboardItem(
      image: "assets/pages/onboard/slider3.svg",
      title: "Control de Finanzas",
      description:
          "El registro de Finanzas de la Iglesia Cordero de Dios - Mahanaim Campamento de Dios",
    )
  ];

  final PageController pageController = PageController();

  double _currentPage = 0;
  double get currentPage => _currentPage;

  void afterFirstLayout() {
    pageController.addListener(() {
      final double page = pageController.page;
      _currentPage = page;
      notifyListeners();
      // if (page % 1 == 0 && _currentPage != page) {
      //   _currentPage = page.toInt();
      //   notifyListeners();
      //   print("current Page  ${pageController.page}");
      // }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
