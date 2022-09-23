import 'package:flutter/material.dart';
import 'package:islamy2/home/providers/setting_provider.dart';
import 'package:islamy2/home/quran/sura_details.dart';
import 'package:provider/provider.dart';

class SuraNameWidget extends StatelessWidget {
  // كلااس لمحتويات كل سوره
  int index; // رقم كل صوره
  String title; // عنوان كل صوره

  SuraNameWidget(this.index , this .title);
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<Setting_provider>(context);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SuraDetails.Routname ,
            arguments: SuraDetailsArgus(index, title));
        // مرر الصفحه ومعاها الارجيومنت عشان يعرضه هو كمان هناك
      },
      child: Text(
        title,
        textAlign: TextAlign.center,

        style: Theme.of(context).textTheme.headline5,
      ),
    );

  }
}
