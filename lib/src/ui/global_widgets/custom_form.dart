import 'input_text.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final Widget child;
  //el @required es para que sea obligatorio ese campo
  const CustomForm({Key key, @required this.child}) : super(key: key);

  @override
  CustomFormState createState() => CustomFormState();

  static CustomFormState of(BuildContext context) {
    return context.findAncestorStateOfType<CustomFormState>();
  }
}

class CustomFormState extends State<CustomForm> {
  final Set<InputTextState> _fields = <InputTextState>{};

  bool validate() {
    bool isOk = true;
    print("🙋‍♂️${_fields.length}");
    //esto es para recorrer en el textfield
    for (final InputTextState item in _fields) {
      //si se cumple esto, quiere decir que tenemos un error en elcampo de texto
      if (item.errorText != null) {
        isOk = false;
        break;
      }
    }
    return isOk;
  }

  void register(InputTextState field) {
    _fields.add(field);
  }

  void remove(InputTextState field) {
    _fields.remove(field);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
