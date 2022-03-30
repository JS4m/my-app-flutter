import 'package:app_delivery/src/routes/routes.dart';
import 'package:app_delivery/src/ui/global_widgets/cicle_buttons.dart';
import 'package:app_delivery/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          "O a través de las redes sociales",
          //style: FontStyles.normal,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleButton(
              onPressed: () {},
              iconPath: "assets/pages/welcome/facebook.svg",
              backgroundColor: Color(0xff066FF5),
            ),
            SizedBox(width: 10),
            CircleButton(
              onPressed: () {},
              iconPath: "assets/pages/welcome/google.svg",
              borderColor: BorderSide(width: 1, color: Colors.black),
              backgroundColor: Colors.white,
            ),
            SizedBox(width: 10),
            CircleButton(
              onPressed: () {},
              iconPath: "assets/pages/welcome/apple.svg",
              backgroundColor: Colors.black,
            ),
          ],
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "¿No tienes una cuenta?",
            ),
            CupertinoButton(
              child: Text("Registrarse", style: FontStyles.regular),
              onPressed: () {
                //Esto es para que llame a la ventana de Registro
                Navigator.pushNamed(context, Routes.REGISTER);
              },
            )
          ],
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
