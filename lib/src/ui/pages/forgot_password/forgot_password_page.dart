import 'package:app_delivery/src/ui/pages/forgot_password/forgot_password_controller.dart';
import 'package:app_delivery/src/ui/pages/forgot_password/widgets/forgot_password_form.dart';
import 'package:app_delivery/src/utils/colors.dart';
import 'package:app_delivery/src/utils/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgotPasswordController>(
      create: (_) => ForgotPasswordController(),
      builder: (_, __) {
        final MediaQueryData data = MediaQuery.of(_);
        final Size size = data.size;
        final padding = data.padding;
        final appBar = AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            color: primaryColor,
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        );

        return Scaffold(
          appBar: appBar,
          body: SafeArea(
            //el container se pone en un safe area
            child: SingleChildScrollView(
              //esto es para que se oculte el teclado mientras haces scroll
              //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  width: double.infinity,
                  height: size.height -
                      padding.top -
                      padding.bottom -
                      appBar.preferredSize.height,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Recuperar Contraseña",
                        style: FontStyles.title.copyWith(
                          fontSize: 22,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 30),
                        child: Text(
                          "Completa los detalles y recupera tu contraseña",
                          style: FontStyles.normal.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ForgotPasswordForm(),
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
