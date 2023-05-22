import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum PearlGender { boy, girl }

class RUIPearl extends StatelessWidget {
  const RUIPearl({
    Key? key,
    required this.pearlGender,
    required this.controller,
    required this.wasRevealed,
    required this.onTap,
  }) : super(key: key);

  final PearlGender pearlGender;
  final VoidCallback onTap;
  final FlipCardController controller;
  final bool wasRevealed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FlipCard(
        onFlip: wasRevealed ? null : onTap,
        flipOnTouch: false,
        controller: controller,
        front: SvgPicture.asset(
          'assets/images/pearl.svg',
          package: 'revel_ui',
        ),
        back: SvgPicture.asset(
          'assets/images/pearl_${pearlGender.name}.svg',
          package: 'revel_ui',
        ),
      ),
    );
  }
}
