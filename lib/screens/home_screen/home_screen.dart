import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playlist_app/widgets/templates/home_screen_template.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeScreenTemplate(),
    );
  }
}
