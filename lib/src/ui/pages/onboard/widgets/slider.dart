import 'package:app_delivery/src/data/models/onboard_item.dart';
import 'package:app_delivery/src/ui/pages/onboard/onboard_controller.dart';
import 'package:app_delivery/src/utils/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardSlider extends StatelessWidget {
  //const OnboardSlider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnboardController>(context, listen: false);

    return Expanded(
      child: PageView(
        controller: controller.pageController,
        children: List.generate(
          controller.items.length,
          (index) {
            final OnboardItem item = controller.items[index];
            return Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Expanded(child: SvgPicture.asset(item.image)),
                    Text(
                      //Formato del Titulo y llamado de el
                      item.title,
                      textAlign: TextAlign.center,
                      style: FontStyles.title,
                    ),
                    //Para la separacion del titulo y Descripción y llamado de el
                    SizedBox(height: 20),
                    Text(
                      item.description,
                      textAlign: TextAlign.center,
                      style: FontStyles.normal,
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
