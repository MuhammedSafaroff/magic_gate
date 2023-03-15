import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({Key? key, required this.icon, this.onTap, this.size = 70})
      : super(key: key);
  final IconData icon;
  final void Function()? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: Colors.white,
            size: size,
          ),
        ),
      ),
    );
  }
}
