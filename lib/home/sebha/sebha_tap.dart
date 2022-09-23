import 'package:flutter/material.dart';

class Sebha extends StatefulWidget {
  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  double angle = 0;
  //هعمل متغير عشان امررو ل angle بتاع اللفات
  int Counter = 0;
  int curent_index = 0;
  List<String> askar = [
    'سبحان الله',
    'الحمدلله',
    'لا اله الا الله',
    'الله اكبر'
  ];
  @override
  Widget build(BuildContext context) {
    Size size =
        MediaQuery.of(context).size; // MediaQuery عملت متغير عشان استخدمه فى
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      child: Column(
        children: [
          Container(
              height: size.height * .4, // حددت الارتفاع بتاع الاستاك يبقي .4

              child: Stack(
                children: [
                  Positioned(
                    left: size.width * .48,
                    child: Image.asset('assets/images/SebhaHead.png'),
                  ),
                  Positioned(
                    top: 80,
                    left: size.width * .21,
                    right: size.width * .21,
                    child: InkWell(
                        // لو عايز اما اضغط يشيل اللون الضغطه
                        // highlightColor: Colors.transparent,
                        //   splashColor: Colors.transparent,
                        onTap: Onpressed,
                        child: Transform.rotate(
                            angle: angle, // هباصى هنا عدد المتغيرات
                            child: Image.asset('assets/images/SebhaBody.png'))),
                  ),
                ],
              )),
          Text('عدد التسبيحات', style: Theme.of(context).textTheme.headline5),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 70,
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              '$Counter',
              style:
                  Theme.of(context).textTheme.headline5?.copyWith(fontSize: 26),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 135,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              askar[curent_index],
              style: Theme.of(context).textTheme.headline5,
            ),
          )
        ],
      ),
    );
  }

  Onpressed() {
    Counter++;
    angle -= 2;
    if (Counter == 34) {
      curent_index++;
      Counter = 0;
    }

    if (curent_index > askar.length - 1) {
      // دى عشان اخر عده خالص يرجع تانى يعد من اول وجديد
      curent_index = 0;
    }
    setState(() {});
  }
}
