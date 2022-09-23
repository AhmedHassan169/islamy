import 'package:flutter/material.dart';
import 'package:islamy2/home/ahdeth/ahdeth_tap.dart';
import 'package:islamy2/home/providers/setting_provider.dart';
import 'package:provider/provider.dart';

// تالت كلاس عندى المحتويات اللى جوا كل حديث
class AhadethDetails extends StatefulWidget {
  static const String Routname = 'ahadethContent';

  @override
  State<AhadethDetails> createState() => _AhadethDetailsState();
}

class _AhadethDetailsState extends State<AhadethDetails> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethArgus;
    // عشان استقبل الكلاس بالبرامتير اللى فيه

    var settingsProvider =
        Provider.of<Setting_provider>(context); // عملت اوبحكت من البروفادير
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(settingsProvider.getMainBackGround()))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.only(top: 60),
              child: Text(
                args.content,
                textDirection: TextDirection
                    .rtl, // دا عشان اقولو الكلام عربي يجي من اليمين
                style: Theme.of(context).textTheme.headline5,
              )),
        ),
      ),
    );
  }
}
