import 'package:app_delivery/src/ui/pages/onboard/onboard_controller.dart';
import 'package:app_delivery/src/ui/pages/onboard/widgets/buttons_controls.dart';
import 'package:app_delivery/src/ui/pages/onboard/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnboardController>(
      create: (_) {
        final controller = OnboardController();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          //llamo al afterFirstLayout que se creó en el onboard_controller.dart
          controller.afterFirstLayout();
        });
        return controller;
      },
      builder: (context, __) => Scaffold(
          body: SafeArea(
              child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      OnboardSlider(),
                      SizedBox(height: 50),
                      OnboardControls(),
                    ],
                  )))),
    );
  }
}
