import 'package:app_delivery/src/ui/pages/login/login_controller.dart';
import 'package:app_delivery/src/ui/pages/login/widgets/login_form.dart';
import 'package:app_delivery/src/ui/pages/login/widgets/social_login.dart';
import 'package:app_delivery/src/utils/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).padding;
    return ChangeNotifierProvider<LoginController>(
      create: (_) => LoginController(),
      builder: (_, __) {
        //esto es para las medidas de la pantalla
        final MediaQueryData data = MediaQuery.of(_);
        final Size size = data.size;
        final padding = data.padding;
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              //esto es para que se oculte el teclado mientras haces scroll
              //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  width: double.infinity,
                  //esto es la altura de nuestra pantalla
                  height: size.height - padding.top - padding.bottom,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Buenas tardes Sam!",
                        style: FontStyles.title.copyWith(
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 25),
                      Expanded(
                        child: SvgPicture.asset(
                          "assets/pages/welcome/login_sam2.svg",
                        ),
                      ),
                      SizedBox(height: 20),
                      //Los input de ingreso de datos
                      LoginForm(),
                      SocialLogin(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
