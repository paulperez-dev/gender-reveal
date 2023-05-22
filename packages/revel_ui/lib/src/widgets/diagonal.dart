import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiagonalLine extends StatelessWidget {
  const DiagonalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/line_diagonal.svg',
      package: 'revel_ui',
    );
  }
}
