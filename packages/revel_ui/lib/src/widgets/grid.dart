import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RUIGrid extends StatelessWidget {
  const RUIGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                'assets/images/line_horizontal.svg',
                package: 'revel_ui',
              ),
              SvgPicture.asset(
                'assets/images/line_horizontal.svg',
                package: 'revel_ui',
              ),
            ],
          ),
        ),
        SizedBox(
          width: 300,
          height: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                'assets/images/line_vertical.svg',
                package: 'revel_ui',
              ),
              SvgPicture.asset(
                'assets/images/line_vertical.svg',
                package: 'revel_ui',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
