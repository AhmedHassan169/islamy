import 'package:flutter/material.dart';
import 'package:islamy2/home/providers/setting_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemBottomSheet extends StatefulWidget {
  @override
  State<ThemBottomSheet> createState() => _ThemBottomSheet();
}

class _ThemBottomSheet extends State<ThemBottomSheet> {
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
              settingsProvider.changeThem(ThemeMode.light);
            },
            child: settingsProvider.isDarkMode()
                ? getUnSelectedRow(AppLocalizations.of(context)!.light)
                : getSelectedRow(AppLocalizations.of(context)!.light),
          ),
          SizedBox(height: 12),
          InkWell(
            onTap: () {
              settingsProvider.changeThem(ThemeMode.dark);
            },
            child: settingsProvider.isDarkMode()
                ? getSelectedRow(AppLocalizations.of(context)!.dark)
                : getUnSelectedRow(AppLocalizations.of(context)!.dark),
          ),
        ],
      ),
    );
  }

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
