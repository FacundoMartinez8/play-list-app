import 'package:flutter/material.dart';
import 'package:playlist_app/providers/home_providers.dart';
import 'package:playlist_app/screens/home_screen/home_screen.dart';
import 'package:playlist_app/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomeProviders()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.getTheme(), // Use the custom theme here
      home: HomeScreen(),
    );
  }
}
