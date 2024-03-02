import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonAppBarAtom extends StatefulWidget {
  final IconData icon;
  final double? size;
  const ButtonAppBarAtom({super.key, required this.icon, this.size});

  @override
  State<ButtonAppBarAtom> createState() => _ButtonAppBarAtomState();
}

class _ButtonAppBarAtomState extends State<ButtonAppBarAtom> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.size ?? 44,
        height: widget.size ?? 44,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(vertical: 9.6, horizontal: 10.21),
            backgroundColor: const Color(0xFFFFFF0D).withOpacity(0.05),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () {},
          child: Icon(
            widget.icon,
            color: Colors.white,
            size: 22,
          ),
        ));
  }
}
