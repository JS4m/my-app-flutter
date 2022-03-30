import 'package:app_delivery/src/data/models/user.dart';
import 'package:app_delivery/src/routes/routes.dart';
import 'package:app_delivery/src/ui/global_widgets/input_text.dart';
import 'package:app_delivery/src/ui/global_widgets/rounded_button.dart';
import 'package:app_delivery/src/ui/pages/login/login_controller.dart';
import 'package:app_delivery/src/utils/dialogs.dart';
import 'package:app_delivery/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  //esta es una funcion que no retorna nada
  void _submit(BuildContext context) async {
    final controller = context.read<LoginController>();
    ProgressDialog.show(context);
    final User user = await controller.submit();
    Navigator.pop(context);
    //Navigator.of(context, rootNavigator: true).pop(context);
    if (user == null) {
      Dialogs.alert(
        context,
        title: "ERROR",
        description: "Inválido Email o Contraseña",
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(context, Routes.HOME, (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context, listen: false);
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 340),
      child: Column(
        children: [
          InputText(
            prefixIcon: Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            validator: (text) {
              if (text.contains("@")) return null;
              return "Invalido Email";
            },
            labelText: "Email",
            textInputAction: TextInputAction.next,
            onChanged: controller.onEmailChanged,
          ),
          SizedBox(height: 20),
          //SizedBox(height: 20),
          InputText(
            prefixIcon: Icon(Icons.lock_outline),
            obscureText: true,
            labelText: "Contraseña",
            textInputAction: TextInputAction.send,
            onChanged: controller.onPasswordChanged,
            onSubmitted: (text) => _submit(context),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: CupertinoButton(
              child: Text(
                "Forgot Password",
                style: FontStyles.regular,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.FORGOT_PASSWORD);
              },
            ),
          ),
          RoundedButton(
            onPressed: () => _submit(context),
            label: "Login",
            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 40),
            fullWidth: false,
          ),
        ],
      ),
    );
  }
}
