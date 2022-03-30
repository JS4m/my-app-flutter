import 'package:app_delivery/src/ui/pages/register/widgets/register_form.dart';
import 'register_controller.dart';
import 'package:app_delivery/src/utils/colors.dart';
import 'package:app_delivery/src/utils/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterController(),
      builder: (_, __) {
        final MediaQueryData data = MediaQuery.of(_);
        final Size size = data.size;
        final padding = data.padding;
        return Scaffold(
          //el appBar es para la barra de arriba con la flecha de retroceder
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              color: primaryColor,
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              //es para minimizar el teclado
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: size.height - padding.top - padding.bottom,
                  ),
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Registrarse!",
                        style: FontStyles.title.copyWith(
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Completa los detalles y crea tu cuenta!",
                        style: FontStyles.normal.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 65),
                      RegisterForm(),
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
