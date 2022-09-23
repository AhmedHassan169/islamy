import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy2/home/providers/setting_provider.dart';
import 'package:islamy2/home/quran/ayat_widget.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  static const String Routname = 'sura';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> ayat = [];
  // String content;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments
        as SuraDetailsArgus; //   هعملت ModalRoute عشان هستقبل الكلاس اللى عنده اكتر من براميتر
    // بتاع الاندكس وعنوان كل سوره واعمله كاستنج

    var settingsProvider =
        Provider.of<Setting_provider>(context); // عملت اوبحكت من البروفادير

    if (ayat.isEmpty) readFile(args.index);

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
        body:
            // لو اول ما تدخل لقيت الليست بتاع الايات فاضيه اعرض CircularProgressIndicator()
            // دى بتاعت اللود غير كدا والداتا جت فا اعرضلى الداتا
            ayat.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    margin: EdgeInsets.all(15),
                    child: ListView.builder(
                      itemCount: ayat.length,
                      itemBuilder: (context, index) {
                        return AyatWidget(index, ayat[index]); //
                      },
                    ),
                  ),
      ),
    );
  }

// هعمل فانكشن بتقرأ الفايل بس هخليها async function عشان تقرأ الفايل
  void readFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');

    ayat = lines;
    setState(() {});
  }
}

// هعمل كلاس تانى عشان هبعتلو اكتر من براميتر بتوع الاندكس والعنوان
// احسن ما اعمل list of index w litle عملتهم ف كلاس مره واخده
class SuraDetailsArgus {
  int index; // اندكس كل صوره
  String title; // عنوان كل صوره
  SuraDetailsArgus(this.index, this.title);
}
