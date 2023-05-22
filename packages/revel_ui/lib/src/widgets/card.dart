import 'package:flutter/material.dart';
import 'package:revel_ui/revel_ui.dart';

class RUICard extends StatelessWidget {
  const RUICard({
    Key? key,
    required this.child,
    this.color = RUIColors.offWhite,
    this.padding = const EdgeInsets.symmetric(
      horizontal: RUISpacing.md,
      vertical: RUISpacing.xxlg,
    ),
    this.margin = const EdgeInsets.symmetric(
      horizontal: RUISpacing.md,
      vertical: RUISpacing.xlg,
    ),
  }) : super(key: key);

  final Widget child;
  final Color color;
  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color.withOpacity(0.85),
        ),
        margin: margin,
        padding: padding,
        child: child,
      ),
    );
  }
}
