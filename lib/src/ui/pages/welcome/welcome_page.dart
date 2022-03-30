import 'package:app_delivery/src/routes/routes.dart';
import 'package:app_delivery/src/ui/global_widgets/cicle_buttons.dart';
import 'package:app_delivery/src/ui/global_widgets/rounded_button.dart';
import 'package:app_delivery/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            //Para que la imagen esté en el Centro
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SvgPicture.asset(
                    "assets/pages/welcome/welcome_sam.svg",
                  ),
                ),
              ),
              //SizedBox(height: 8),
              Text(
                "Bienvenido",
                style: FontStyles.title,
              ),
              SizedBox(height: 20),
              //Debes de llevar el curso de Api para asignar los valores dinamicos
              //para que la pantalla se adapte a cualquier dispositivo.
              Text(
                "Esta es la mejor aplicación para el control de Registros \n de la iglesia Cordero de Dios !",
                //style: FontStyles.normal,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              //esto es para que los botones de login y registro esten del mismo tamaño
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 280,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RoundedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Routes.LOGIN);
                        },
                        label: "Login",
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: RoundedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.REGISTER);
                        },
                        label: "Registrar",
                        textColor: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
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
              SizedBox(height: 25),
            ],
          )),
    ));
  }
}
