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
    var providerData = Provider.of<ProviderData>(context, listen: false);
    var provider = Provider.of<ProviderData>(context);

    return GestureDetector(
      child: Builder(builder: (context) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 0),
          curve: Curves.easeIn,
          transform: Matrix4.identity()
            ..translate(
              provider.position.dx,
              provider.position.dy,
            ),
          child: buildCard(),
        );
      }),
      onPanUpdate: (details) {
        providerData.updateUpdatePosition(details);
      },
      onPanStart: (details) {
        providerData.updateStartPosition(details);
      },
      onPanEnd: (details) {
        providerData.updateEndPosition(details);
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
