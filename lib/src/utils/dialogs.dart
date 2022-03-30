import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Dialogs {
  static Future<void> alert(
    BuildContext context, {
    String title,
    String description,
    String okText = "OK",
    //en el caso de que sea true
    bool dissmisible = true,
  }) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: dissmisible,
      builder: (_) => WillPopScope(
        // en el caso de que dissmisble es verdadero
        // vamos a permitir que se minimice el dialog
        //--- pero en caso de que dissmisble sea falso
        //la linea de abajo no va a permitir que se minimice el dialogo , al menos que se llame a Navigator.Pop
        onWillPop: () async => dissmisible,
        child: CupertinoAlertDialog(
          title: title != null ? Text(title) : null,
          content: description != null ? Text(description) : null,
          actions: [
            //FlatButton  o TextButton o mejor un cupertino
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text(okText),
            ),
          ],
        ),
      ),
    );
  }
}

abstract class ProgressDialog {
  static Future<void> show(BuildContext context) {
    //aqui en vez de show Dialog , puedes usar mejor este:
    return showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          //para centrar el icono de cargando
          alignment: Alignment.center,
          color: Colors.white30,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
