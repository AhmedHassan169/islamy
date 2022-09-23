import 'package:flutter/material.dart';
import 'package:islamy2/home/ahdeth/ahdeth_tap.dart';
import 'package:islamy2/home/providers/setting_provider.dart';
import 'package:islamy2/home/quran/quran_tap.dart';
import 'package:islamy2/home/radio/radio_tap.dart';
import 'package:islamy2/home/sebha/sebha_tap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy2/home/setting/setting_tap.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  static const String Routname = 'sebha';

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int selectedIndex =
      0; //  دا اللى بيتحكم ف التنقل بين الشاشات عن طريقه البار اللى تحت
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<Setting_provider>(context);
    // هعمل اوبجكت من البروفايدر عشان استدعيه تحت

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                settingsProvider.getMainBackGround(),
              ))),
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          AppLocalizations.of(context)!
              .app_title, // بستخدمها عشان اقول هاتلى الترجمه هنا
        )),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex:
              selectedIndex, //currentIndex : دا اللى بيتحكم ف الشاشه المعروضه
          // عملت currentIndex بمتغير عشان اعرف اتنقل بين التاب

          onTap: (index) {
            // عشان اما يدوس يروح عالتاب اللى اتداست عليها
            selectedIndex = index;
            setState(() {});
          },

          items: [
            // ImageIcon : هنا بتحول الصوره وتخليها تتعامل معامله الايقون
            BottomNavigationBarItem(
              // عملت سيم للباكجراوند وجبتو منو
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,

              icon: const ImageIcon(
                AssetImage('assets/images/quran.png'),
              ),
              label: AppLocalizations.of(context)!.quran_title,
            ),

            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              icon: const ImageIcon(
                AssetImage('assets/images/ahdeth.png'),
              ),
              label: AppLocalizations.of(context)!.hadeth_title,
            ),
            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              icon: const ImageIcon(
                AssetImage('assets/images/sebha.png'),
              ),
              label: AppLocalizations.of(context)!.sebha_title,
            ),
            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              icon: const ImageIcon(
                AssetImage('assets/images/ic_radio.png'),
              ),
              label: AppLocalizations.of(context)!.radio_title,
            ),
            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              icon: Icon(Icons.settings),
              label: 'setting',
            ),
          ],
        ),
        body: Taps[selectedIndex],
      ),
    );
  }

  List<Widget> Taps = [Quran(), Ahdeth(), Sebha(), Radio_tap(), SettingTap()];
}
