import 'package:flutter/material.dart';
import 'package:playlist_app/widgets/molecules/app_bar.dart';
import 'package:playlist_app/widgets/molecules/float_navigator_button_bar.dart';
import 'package:playlist_app/widgets/molecules/posts.dart';

class HomeScreenTemplate extends StatefulWidget {
  const HomeScreenTemplate({super.key});

  @override
  State<HomeScreenTemplate> createState() => _HomeScreenTemplateState();
}

class _HomeScreenTemplateState extends State<HomeScreenTemplate> {
  int _selectedIndex = 0;

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(17, 4, 23, 1.0),
        floatingActionButton: CustomBottomNavBar(
          selectedIndex: _selectedIndex,
          onItemSelected: _onItemSelected,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: const CustomScrollView(
          slivers: <Widget>[
            CustomSliverAppBar(
              title: 'Live Video Calls',
            ),
            SliverToBoxAdapter(child: PostsWidget())
          ],
        ));
  }
}
