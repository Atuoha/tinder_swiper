import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tinder_swiper/provider/data.dart';
import 'package:tinder_swiper/widget/tinder_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: buildWidgets(),
        ),
      ),
    );
  }

  Widget buildWidgets() {
    final providerData = Provider.of<ProviderData>(context, listen: false);
    final imgUrls = providerData.imgUrls;

    return Stack(
      children: imgUrls
          .map(
            (imgUrl) => TinderCard(
              imgUrl: imgUrl,
              isFrontImage: imgUrls.last == imgUrl,
            ),
          )
          .toList(),
    );
  }
}
