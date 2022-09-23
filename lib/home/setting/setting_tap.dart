import 'package:flutter/material.dart';
import 'package:islamy2/home/providers/setting_provider.dart';
import 'package:islamy2/home/setting/LanguageBottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:islamy2/home/setting/ThemBottomSheet.dart';
import 'package:provider/provider.dart';

class SettingTap extends StatefulWidget {
  @override
  State<SettingTap> createState() => _SettingTapState();
}

class _SettingTapState extends State<SettingTap> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<Setting_provider>(context);
    return Container(
        margin: const EdgeInsets.only(top: 25),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  ShowlanguageBottomSheet();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: Text(
                    // هعمل اتشيك بالبروفايدر عشان اللى هيتعرض
                    settingsProvider.currentlang == 'en'
                        ? 'English'
                        : 'العربيه',

                    style: Theme.of(context).textTheme.headline5,
                  ),
                )),

            /// من اول هنا بتااع  السييييم
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Show();
              },
              child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: Text(
                    // هعمل اتشيك بالبروفايدر عشان اللى هيتعرض
                    settingsProvider.isDarkMode()
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.headline5,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
  //  ModalBottomSheet دى اما باجى ادوس على تغير اللغه او السيم بيطلع

  void ShowlanguageBottomSheet()  {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return LanguageBottomSeet();
        });
  }

  void Show() //  ModalBottomSheet دى اما باجى ادوس على تغير   السيم بيطلع
  {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return ThemBottomSheet();
        });
  }
}
