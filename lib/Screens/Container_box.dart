import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {
  final Color? boxColor;

  final Widget? childWidget;
  final Widget? widht;

  const ContainerBox({Key? key, this.boxColor, this.childWidget, this.widht})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: boxColor,
      ),
    );
  }
}
