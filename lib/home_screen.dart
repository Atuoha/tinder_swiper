import 'package:flutter/material.dart';
import 'package:tinder_swiper/widget/tinder_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: const TinderCard(
            imgUrl:
                'https://i.pinimg.com/564x/f5/72/72/f572723e31d6972cdd65d93dbf481d40.jpg',
          ),
        ),
      ),
    );
  }
}
