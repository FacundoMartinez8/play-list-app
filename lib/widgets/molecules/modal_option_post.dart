import 'package:flutter/material.dart';
import 'package:playlist_app/widgets/atoms/button_options_post.dart';

class ModalOptionPost extends StatelessWidget {
  const ModalOptionPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(40, 26, 48, 1.0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
              width: 55,
              height: 5,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonOptionDetailPost(
                    icon: const Icon(
                      Icons.mode_edit_outline_outlined,
                      color: Colors.white,
                    ),
                    text: 'Edit',
                    onPressed: () {}),
                const SizedBox(
                  width: 15,
                ),
                ButtonOptionDetailPost(
                    icon: const Icon(
                      Icons.share_outlined,
                      color: Colors.white,
                    ),
                    text: 'Share',
                    onPressed: () {}),
                const SizedBox(
                  width: 15,
                ),
                ButtonOptionDetailPost(
                    icon: const Icon(
                      Icons.archive,
                      color: Colors.white,
                    ),
                    text: 'Archive',
                    onPressed: () {}),
                const SizedBox(
                  width: 15,
                ),
                ButtonOptionDetailPost(
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                    text: 'Delete',
                    onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
