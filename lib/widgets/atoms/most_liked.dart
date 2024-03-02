import 'package:flutter/material.dart';

class MostLiked extends StatelessWidget {
  const MostLiked({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 76,
        height: 26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(0, 0, 0, 0.4),
        ),
        child: const Center(
          child: Text(
            'Most Liked',
            style: TextStyle(
                fontSize: 12, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ));
  }
}
