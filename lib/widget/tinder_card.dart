import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder_swiper/provider/data.dart';

class TinderCard extends StatefulWidget {
  const TinderCard({Key? key, required this.imgUrl}) : super(key: key);
  final String imgUrl;

  @override
  State<TinderCard> createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: buildFrontCard(),
    );
  }

  Widget buildFrontCard() {
    return GestureDetector(
      child: buildCard(),
      onPanUpdate: (details) {
        Provider.of<ProviderData>(context).updateEndPosition(details);
      },
      onPanStart: (details) {
        Provider.of<ProviderData>(context).updateStartPosition(details);
      },
      onPanEnd: (details) {
        Provider.of<ProviderData>(context).updateEndPosition(details);
      },
    );
  }

  Widget buildCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: NetworkImage(widget.imgUrl),
            fit: BoxFit.cover,
            alignment: const Alignment(-0.3, 3)),
      ),
    );
  }
}
