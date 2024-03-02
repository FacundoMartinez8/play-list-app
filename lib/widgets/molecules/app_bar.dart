import 'package:flutter/material.dart';
import 'package:playlist_app/theme/theme.dart';

import 'package:playlist_app/widgets/atoms/button_app_bar.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  final Widget leading;
  final List<Widget>? actions;

  const CustomSliverAppBar({
    Key? key,
    required this.title,
    this.leading = const SizedBox(),
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Colors.transparent,
        leading: Transform.scale(
          scale: 0.8,
          child: const ButtonAppBarAtom(
            icon: Icons.arrow_back_ios_rounded,
          ),
        ),
        pinned: true,
        expandedHeight: 285,
        flexibleSpace: FlexibleSpaceBar(
          expandedTitleScale: 1,
          title: _buildBottomTitleAndButtons(title),
          background: Stack(
            children: [
              Image.asset(
                'lib/assets/images/background_image_app_bar.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Container(
                decoration: CustomTheme().gradientContainer1,
                child: Container(
                  decoration: CustomTheme().gradientContainer2,
                ),
              ),
            ],
          ),
        ));
  }
}

Widget _buildBottomTitleAndButtons(title) {
  return Container(
    color: Colors.transparent,
    padding: const EdgeInsets.only(right: 10),
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
              title,
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
