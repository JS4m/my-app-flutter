import 'custom_form.dart';
import 'package:app_delivery/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final Widget prefixIcon;
  final String Function(String) validator;
  final bool obscureText;
  final void Function(String) onChanged;
  final void Function(String) onSubmitted;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String labelText;

  const InputText({
    Key key,
    this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.labelText,
  }) : super(key: key);

  @override
  InputTextState createState() => InputTextState();
}

class InputTextState extends State<InputText> {
  String _errorText = '';
  bool _obscureText;
  CustomFormState _formState;

  String get errorText => _errorText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _formState = CustomForm.of(context);
      final formState = CustomForm.of(context);
      formState?.register(this);
    });
  }

  //es casi similar a dispose
  //deactivite se invoca antes de dispose
  //se invoca cuando nuestro widget va a ser eliminado del arbol de widget de
  //sin embargo , dispose es invocado cuando nuestro widget
  //ya es eliminado.
  //deactivate : utilizar antes de que se elimine el widget
  //dispose: cuando el widget ya fue eliminado
  @override
  void deactivate() {
    _formState?.remove(this);
    super.deactivate();
  }

  void _validate(String text) {
    if (widget.validator != null) {
      _errorText = widget.validator(text);
      if (mounted) {
        setState(() {});
      }
    }
    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }

  //Funcionalidad para visibilidad
  void _onVisibleChanged() {
    if (mounted) {
      setState(() {
        _obscureText = !_obscureText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _validate,
      obscureText: _obscureText,
      onSubmitted: widget.onSubmitted,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5),
        prefixIcon: widget.prefixIcon,
        labelText: widget.labelText,
        suffixIcon: widget.obscureText
            ? CupertinoButton(
                minSize: 25,
                padding: EdgeInsets.all(10),
                child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: _onVisibleChanged,
              )
            : Icon(
                Icons.check_circle,
                //condición de If - si isok es verdadero , utilza , primary color , si no colors.grey
                color: _errorText == null ? primaryColor : Colors.grey,
              ),
      ),
    );
  }
}
