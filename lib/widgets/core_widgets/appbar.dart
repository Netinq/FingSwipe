import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/language_provider.dart';
import '../menu_widgets/language_button.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({
    Key key,
  })  : preferredSize = Size.fromHeight(110.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final language = Provider.of<LanguageProvider>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 80,
              child: Image.asset('assets/logo.png', fit: BoxFit.fitWidth,),
            ),
            Row(
              children: [
                if (!language.translateToFrench) LanguageButton(
                  imageAssetLink: 'icons/flags/png/fr.png',
                  onTap: () {
                    language.toFrench();
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                if (language.translateToFrench) LanguageButton(
                  onTap: () {
                    language.toEnglish();
                  },
                  imageAssetLink: 'icons/flags/png/gb.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
