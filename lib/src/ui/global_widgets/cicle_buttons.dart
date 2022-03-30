import 'package:app_delivery/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  final double size;
  final Color backgroundColor;
  final BorderSide borderColor;
  //iconColor

  const CircleButton({
    Key key,
    @required this.onPressed,
    @required this.iconPath,
    this.size = 40,
    this.backgroundColor = primaryColor,
    this.borderColor,

    //MaterialColor borderColor = greyColor,
    //this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: this.onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        width: this.size,
        height: this.size,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: this.backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.withOpacity(0.19),
            style: BorderStyle.solid,
          ),
        ),
        child: SvgPicture.asset(
          this.iconPath,

          //color: this.iconColor,
        ),
      ),
    );
  }
  //para poner borde a Google
  //border: Border.all(
  // color: Colors.grey,
  // ),
}
