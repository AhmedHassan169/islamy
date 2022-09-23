import 'package:flutter/material.dart';
import 'package:islamy2/My_Them.dart';
import 'package:islamy2/home/ahdeth/ahdth_details.dart';
import 'package:islamy2/home/home.dart';
import 'package:islamy2/home/providers/setting_provider.dart';
import 'package:islamy2/home/quran/sura_details.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

// عشان استخدم provider :
//1- هحط الابلكشين كلو من اول الماتيرل فى حاجه اسمها ChangeNotifierProvider
// 2- هباصى الكلاس بتاع provider جواه
void main() {
  runApp(ChangeNotifierProvider<Setting_provider>(
      create: (buildContext) {
        return Setting_provider();
      },
      child: Myapp()));
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // هستعدى كلاس provider واخد نسخه منه
    var settingsProvider = Provider.of<Setting_provider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'بسم الله الرحمن الرحيم',
      // هعمل سيم عشان اظبط بيه الوان البرنامج كله
      theme: MyThem.light_them,
      darkTheme: MyThem.Dark_them,

      themeMode: settingsProvider
          .currentThem, // هنا قلتلو هاتلى السيم اللى محطوط فى البروفايدر وحطولى لابلكشين كلو
      //كدا بقول للبرنامج انو اجبارا اشتغل ف السيم المعين
      // واروح احطو جوا provider

      initialRoute: home.Routname, // دا الاسكرين اللى البرنامج هيبدأ من عندها
      routes: {
        // هنا بعرف كل الاسكرين اللى عندى عشان اربطهم ببعض عشان اعرف اتنقل بينهم
        home.Routname: (_) => home(),
        SuraDetails.Routname: (_) => SuraDetails(),
        AhadethDetails.Routname: (_) => AhadethDetails(),
      },

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        // دا اللى بقول جواه احنا عايزين اللغات بتاعتنا هتكون ايه
        Locale('en'), // English, no country code
        Locale('ar'), // Arabic, no country code
      ],
      // local: دا اللى بيفرض اليوزر على استخدام الحاجه هو ايه
      // فا هخليه ياخد اللغه من الكلاس اللى عامله ل provider 4-
      locale: Locale(settingsProvider.currentlang),
    );
  }
}
