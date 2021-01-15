import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:connect/utils/universal_variables.dart';

class ShimmeringLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: Shimmer.fromColors(
        baseColor: UniversalVariables.blackColor,
        highlightColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Connect"),
        ),
        period: Duration(seconds: 1),
      ),
    );
  }
}