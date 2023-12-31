import 'package:flutter/material.dart';
import 'package:music_app/widgets/custom_text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {required this.text,
      this.icon,
      this.onPressed,
      this.buttonColor,
      this.enableBorder=true});
  final void Function()? onPressed;
  final String text;
  final IconData? icon;
  final Color? buttonColor;
  final bool? enableBorder;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        constraints: BoxConstraints(minWidth: MediaQuery.sizeOf(context).width/2.5),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonColor),
            shape:enableBorder==true?MaterialStateProperty.all(RoundedRectangleBorder(
                side:const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(40))):null),
        onPressed: onPressed,
        icon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 18),
              const SizedBox(width: 5),
              CustomTextWidget(
                text: text,
              )
            ],
          ),
        ));
  }
}
