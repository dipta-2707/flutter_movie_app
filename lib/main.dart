import 'package:flutter/material.dart';

import 'Theme/theme.dart';
import 'view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(
        title: 'Movie Bucket',debugShowCheckedModeBanner: false, theme: MyTheme.darkTheme, home: const MyHome());
  }
}
