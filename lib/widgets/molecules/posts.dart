import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playlist_app/providers/home_providers.dart';

import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';

class PostsWidget extends StatefulWidget {
  const PostsWidget({super.key});

  @override
  State<PostsWidget> createState() => _PostsWidgetState();
}

class _PostsWidgetState extends State<PostsWidget> {
  List<Widget> posts = HomeProviders().post;
  List<String> imageList = [
    'lib/assets/images/image_post_1.png',
    'lib/assets/images/image_post_2.png',
    'lib/assets/images/image_post_3.png',
    'lib/assets/images/image_post_4.png',
  ];

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      Widget row = posts.removeAt(oldIndex);
      posts.insert(newIndex, row);
    });
  }

  @override
  Widget build(BuildContext context) {
    posts = context.watch<HomeProviders>().post;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color.fromRGBO(17, 4, 23, 1.0), // Color inferior
            Color.fromRGBO(42, 8, 53, 1.0), // Color superior
          ],
        ),
      ),
      child: Center(
        child: ReorderableWrap(
            spacing: 10.0,
            runSpacing: 4.0,
            padding: const EdgeInsets.all(8),
            onReorder: _onReorder,
            onNoReorder: (int index) {
              debugPrint(
                  '${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
            },
            onReorderStarted: (int index) {
              debugPrint(
                  '${DateTime.now().toString().substring(5, 22)} reorder started: index:$index');
            },
            children: posts),
      ),
    );
  }
}
