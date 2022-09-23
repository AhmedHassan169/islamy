import 'package:flutter/material.dart';
import 'package:islamy2/home/providers/setting_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSeet extends StatefulWidget {
  @override
  State<LanguageBottomSeet> createState() => _LanguageBottomSeetState();
}

class _LanguageBottomSeetState extends State<LanguageBottomSeet> {
  @override
  Widget build(BuildContext context) {
    // هستعدى كلاس provider واخد نسخه منه
    var settingsProvider = Provider.of<Setting_provider>(context);

    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                // هنا اما ادوس عليها عايز اغير اللغه من provider واخليها en
                settingsProvider.changelanguage('en');
              },
              child: settingsProvider.currentlang == 'en'
                  ?
                  // لو اللغه الموجوده هى انجلش فا حطلى ليه خصائص الويتجت المتحدده
                  // غير كدا اديلو خصائص الويتجت اللى مش متحدده
                  getSelectedRow('English')
                  : getUnSelectedRow('English')),
          SizedBox(height: 12),
          InkWell(
              onTap: () {
                // هنا اما ادوس عليها عايز اغير اللغه من provider واخليها عربي
                settingsProvider.changelanguage('ar');
              },
              child: settingsProvider.currentlang == 'ar'
                  ? getSelectedRow('العربية')
                  : getUnSelectedRow('العربية')),
        ],
      ),
    );
  }

  // هعتبرها الويتجت المتحدده
  Widget getSelectedRow(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style:
                TextStyle(fontSize: 27, color: Theme.of(context).primaryColor)),
        Icon(Icons.check, color: Theme.of(context).primaryColor),
      ],
    );
  }

// هعتبرها الويتجت مش متحدده
  Widget getUnSelectedRow(String text) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }
}
