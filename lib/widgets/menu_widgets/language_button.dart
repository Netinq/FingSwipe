import 'package:flutter/material.dart';

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
