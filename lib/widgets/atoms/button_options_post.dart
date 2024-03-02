import 'package:flutter/material.dart';

class ButtonOptionDetailPost extends StatelessWidget {
  final Icon icon;
  final String text;
  final Function()? onPressed;
  const ButtonOptionDetailPost(
      {super.key, required this.icon, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromRGBO(255, 255, 255, 0.05),
            ),
            child: IconButton(
              icon: icon,
              onPressed: onPressed,
            )),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
