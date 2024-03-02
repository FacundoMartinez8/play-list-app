import 'package:flutter/material.dart';
import 'package:playlist_app/widgets/atoms/button_app_bar.dart';

class ContentAppbar extends StatefulWidget {
  final String title = 'Live Video Calls';
  const ContentAppbar({super.key});

  @override
  State<ContentAppbar> createState() => _ContentAppbarState();
}

class _ContentAppbarState extends State<ContentAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 400,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const Text(
                '100 videos | 04:29:30',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          const Row(
            children: [
              ButtonAppBarAtom(
                icon: Icons.mode_edit_outline_outlined,
              ),
              SizedBox(width: 5),
              ButtonAppBarAtom(
                icon: Icons.more_vert_sharp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
