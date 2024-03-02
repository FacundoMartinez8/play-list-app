import 'package:flutter/material.dart';
import 'package:playlist_app/widgets/molecules/post_content.dart';

class HomeProviders extends ChangeNotifier {
  final List<Widget> _post = [
    const PostContent(
      id: 'ABC123',
      image: 'lib/assets/images/image_post_1.png',
      date: '10/02/2023',
      mostLiked: true,
      like: 2.1,
      description: 'Magazine haul #vogue #voguemagazine',
    ),
    const PostContent(
      id: 'DEF456',
      image: 'lib/assets/images/image_post_2.png',
      date: '19/11/2024',
      mostLiked: true,
      like: 122.1,
      description: 'Cooking mama #pastaforthe win',
    ),
    const PostContent(
      id: 'GHI789',
      image: 'lib/assets/images/image_post_3.png',
      date: '20/12/2021',
      mostLiked: true,
      like: 32.4,
      description: 'Cooking mama #pastaforthe win',
    ),
    const PostContent(
      id: 'JKL101',
      image: 'lib/assets/images/image_post_4.png',
      date: '01/03/2024',
      mostLiked: true,
      like: 1.7,
      description: 'Magazine haul #vogue #voguemagazine',
    ),
  ];
  List<Widget> get post => _post;

  PostContent? _showModalOption;

  PostContent? get showModalOption => _showModalOption;

  void addPost(Widget post) {
    _post.add(post);
    notifyListeners();
  }

  void setShowModalOption(PostContent? post) {
    _showModalOption = post;
    notifyListeners();
  }
}
