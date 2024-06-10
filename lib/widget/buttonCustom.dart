import 'package:flutter/material.dart';

class ButtomCustom extends StatefulWidget {
  const ButtomCustom(
      {super.key,
      required this.onPressed,
      this.isSplashScreen,
      required this.title,
      required this.textSize,
      this.margin,
      this.padding,
      this.borderRadius});
  final Function onPressed;
  final bool? isSplashScreen;
  final String title;
  final double textSize;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  @override
  State<ButtomCustom> createState() => _ButtomCustomState();
}

class _ButtomCustomState extends State<ButtomCustom> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPressed(),
      child: Container(
        padding: widget.padding ??
            const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
        margin: widget.margin,
        decoration: BoxDecoration(
            gradient: widget.isSplashScreen == null
                ? const LinearGradient(
                    colors: [
                      Color(0xFFEB6E2C),
                      Color(0xFFFABD1D),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )
                : null,
            color: widget.isSplashScreen != null ? Colors.white : null,
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(widget.borderRadius ?? 50),
                right: Radius.circular(widget.borderRadius ?? 50))),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
                fontSize: widget.textSize,
                fontWeight: FontWeight.bold,
                color: widget.isSplashScreen == null
                    ? Colors.white
                    : const Color(0xffEB6E2C)),
          ),
        ),
      ),
    );
  }
}
