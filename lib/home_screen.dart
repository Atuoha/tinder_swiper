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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Prime Ape Planet (PAP) Nft',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.black,
        child: Icon(
          Icons.star,
          color: Colors.orange,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: buildWidgets(),
        ),
      ),
    );
  }

  Widget buildWidgets() {
    final providerData = Provider.of<ProviderData>(context);
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
