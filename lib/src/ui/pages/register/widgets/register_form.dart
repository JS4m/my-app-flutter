import 'package:app_delivery/src/ui/global_widgets/custom_form.dart';
import 'package:app_delivery/src/ui/global_widgets/input_text.dart';
import 'package:app_delivery/src/ui/global_widgets/rounded_button.dart';
import 'package:app_delivery/src/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../register_controller.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key key}) : super(key: key);

  void _submit(BuildContext context) async {
    final controller = context.read<RegisterController>();
    final isformOk = controller.formKey.currentState.validate();
    //print("👻 isFormOk $isformOk");
    if (isformOk) {
      ProgressDialog.show(context);
      final isOk = await controller.submit();
      Navigator.pop(context);
      if (!isOk) {
        Dialogs.alert(
          context,
          title: "ERROR",
          description: "Registro Fallido",
        );
      } else {
        await Dialogs.alert(
          context,
          title: "Éxito",
          //para no permitir que el dialogo sea minimizado dando click fuera del dialogo
          dissmisible: false,
          description: "Se registró correctamente",
          okText: "Ir a iniciar sesión",
        );
        Navigator.pop(context);
      }
    } else {
      Dialogs.alert(
        context,
        title: "ERROR",
        description: "Entradas inválidas",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RegisterController>();
    return CustomForm(
      //aqui pasamos la validacion de los campos por si dan error:
      key: controller.formKey,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 340),
        child: Column(
          children: [
            InputText(
              labelText: "Nombres",
              validator: (text) {
                return text.trim().length > 1 ? null : "Nombres Incorrectos";
              },
              prefixIcon: Icon(Icons.person_outline),
              textInputAction: TextInputAction.next,
              onChanged: controller.onNameChanged,
            ),
            SizedBox(height: 15),
            InputText(
              labelText: "Apellidos",
              validator: (text) {
                return text.trim().length > 1 ? null : "Apellidos Incorrectos";
              },
              prefixIcon: Icon(Icons.person_add_outlined),
              textInputAction: TextInputAction.next,
              onChanged: controller.onLastNameChanged,
            ),
            SizedBox(height: 15),
            InputText(
              labelText: "Email",
              validator: (text) {
                return text.contains("@") ? null : "Email Incorrecto";
              },
              prefixIcon: Icon(Icons.email_outlined),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.send,
              onChanged: controller.onEmailChanged,
              onSubmitted: (text) => _submit(context),
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerRight,
              child: RoundedButton(
                label: "Registrarse",
                fullWidth: false,
                onPressed: () {
                  _submit(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
