import 'package:cuidapet_mobile/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class CuidapetDefaultButton extends StatelessWidget {
  final String label;
  final double heigth;
  final double width;
  final double padding;
  final Color? color;
  final Color? labelColor;
  final double borderRadius;
  final VoidCallback? onPressed;

  const CuidapetDefaultButton({
    Key? key,
    required this.label,
    this.heigth = 66,
    this.width = double.infinity,
    this.padding = 10,
    this.color,
    this.borderRadius = 10,
    this.labelColor = Colors.white,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: width,
      height: heigth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)),
            primary: color ?? context.primaryColor),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: labelColor,
          ),
        ),
      ),
    );
  }
}
