import 'package:flutter/material.dart';
import 'package:tinder_swiper/provider/data.dart';
import 'home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => ProviderData(),
        child: const HomeScreen(),
      ),
    );
  }
}
