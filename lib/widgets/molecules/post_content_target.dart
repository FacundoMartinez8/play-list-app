import 'package:flutter/material.dart';

class PostContentTarget extends StatelessWidget {
  const PostContentTarget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue.withOpacity(0.5),
      ),
      child: const Center(
        child: Text('Item '),
      ),
    );
  }
}
