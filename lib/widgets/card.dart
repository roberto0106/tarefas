import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color; // cor de fundo do card
  final Widget child; // conteúdo do card
  final Function()? onTap; // função a ser chamada quando o card é tocado

  CustomCard({required this.color, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 150,
        child: Card(
          color: color,
          // elevation: 5.0,
          margin: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: child,
        ),
      ),
    );
  }
}
