import 'package:fingSwipeV2/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LanguageButton extends StatelessWidget {
  final String imageAssetLink;
  final void Function() onTap;

  const LanguageButton({
    Key key,
    this.imageAssetLink,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(imageAssetLink, package: 'country_icons', height: 50,),
      ),
    );
  }
}
