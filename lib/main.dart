import 'package:flutter/material.dart';
import 'package:hot_or_cold_game/view/home/view/hot_cold_view.dart';
import 'package:hot_or_cold_game/view/home/view/hot_cold_vieww.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HotColdView(),
    );
  }
}
