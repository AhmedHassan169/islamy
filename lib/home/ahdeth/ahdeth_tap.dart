import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy2/home/ahdeth/ahdeth_name_wedget.dart';

// الكلاس الاول
class Ahdeth extends StatefulWidget {
  @override
  State<Ahdeth> createState() => _AhdethState();
}


class _AhdethState extends State<Ahdeth> {
  List<HadethArgus> hadethList = [];



  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty)
      loadhadethdata();

    return
    Column(
      children: [
    Center(child: Image.asset('assets/images/ahdes.png')),
    SizedBox(height: 3),
    Container(
    width: double.infinity,
    alignment: Alignment.center,
    // عملت كونتير عشان اعمل الحدود بتاعت اللى بين الكلام
    decoration: BoxDecoration(
    border: Border.symmetric(
    horizontal:
    BorderSide(color: Theme.of(context).primaryColor , width: 3)),
    ),
    child: Text(
    'الاحاديث',
    style: Theme.of(context).textTheme.headline4,
    )),
    hadethList.isEmpty ?
    Center(child: CircularProgressIndicator()) :
    Expanded(
      child:
      ListView.separated(
      itemBuilder: (context, index) {
      return HadethNameWidget(hadethList[index]);
      },
      separatorBuilder: (context, index) => SizedBox(
      height: 5,
      ),
      itemCount: hadethList.length),
      // ListWheelScrollView(
      //   children: [HadethNameWidget(hadethList[index])],
      //   itemExtent: hadethList.length,
      //   diameterRatio: 1.5,
      // )
    ),
      ],
    );

  }

  // هعمل فانكشن عشان اقرأ الفايل بتاع الحديث
  void loadhadethdata() async {
    List<HadethArgus> mHadethList = [];

    // هعمل load للفايل فى content
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');

    // بعدين هاخد content هعملها split واحطها فى allHadith
    List<String> allHadith = content.trim().split('#');

    //   عملت split عشان اقول للكود بين كل الحاجه اللى بعمل بيها قسمهم اندكس #

    for (int i = 0; i < allHadith.length; i++)
    // هعمل فور بتلف على الفايل كله اللى انا عامله split
    {
      // عايز اجيب tittle لوحده و content لوحده
      // هاخد السطر الاول اللى هو العنوان احطو ف singleHeadthContent
      String singleHeadthContent = allHadith[i];
      // بعد كدا هقسم تانى بين tittle w content ب n\
      List<String> hadethLine = singleHeadthContent.trim().split('\n');
      // بعد ما قسمت هتاخد الاول قبل ما تقسم حطو  ف title
      String title = hadethLine[0];
      if (title.isEmpty) continue; // عشان لو لقيت سطر فاضى
      // بعد ما ختو شيلو
      hadethLine.removeAt(0);
      // جمع الباقى وحطو بقا ف content
      String content = hadethLine.join('\n');
      // بعدين عملت كلاس تحت عشان امررلو title w conent عشان استخدمهم بعد كدا من الكلاس
      HadethArgus h = HadethArgus(title, content);
      mHadethList.add(h); // همرر الداتا اللى جبتها من  الفايل ل الكلاس
    }
    this.hadethList = mHadethList;
    setState(() {});
  }
}

// هعمل كلاس اكتب فيه العنوان والمحتوى وابقي امررو كابرامتير
// بدل ما اعمل ليست من العنواين وليست من المحتوى
class HadethArgus {
  String title; // اندكس كل صوره
  String content; // عنوان كل صوره
  HadethArgus(this.title, this.content);
}
