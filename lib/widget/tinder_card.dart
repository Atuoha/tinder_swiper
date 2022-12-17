import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder_swiper/provider/data.dart';

class TinderCard extends StatefulWidget {
  const TinderCard({Key? key, required this.imgUrl, required this.isFrontImage}) : super(key: key);
  final String imgUrl;
  final bool isFrontImage;

  @override
  State<TinderCard> createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Size size = MediaQuery.of(context).size;
      final providerData = Provider.of<ProviderData>(context, listen: false);
      providerData.updateScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: widget.isFrontImage ? buildFrontCard(): buildCard(),
    );
  }

  Widget buildFrontCard() {
    final providerData = Provider.of<ProviderData>(context, listen: false);
    final provider = Provider.of<ProviderData>(context);

    return GestureDetector(
      child: LayoutBuilder(builder: (context, constraints) {
        final center = constraints.smallest.center(Offset.zero);
        final angle = provider.angle * pi / 180;
        final rotatedMatrix = Matrix4.identity()
          ..translate(center.dx, center.dy)
          ..rotateZ(angle)
          ..translate(-center.dx, -center.dy);

        return AnimatedContainer(
          duration: Duration(milliseconds: providerData.isDragging ? 400 : 0),
          curve: Curves.easeIn,
          transform: rotatedMatrix
            ..translate(
              provider.position.dx,
              provider.position.dy,
            ),
          child: buildCard(),
        );
      }),
      onPanUpdate: (details) {
        providerData.updatePosition(details);
      },
      onPanStart: (details) {
        providerData.startPosition(details);
      },
      onPanEnd: (details) {
        providerData.endPosition();
      },
    );
  }

  Widget buildCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage(widget.imgUrl),
            fit: BoxFit.cover,
            alignment: const Alignment(-0.3, 3),),
      ),
    );
  }
}
