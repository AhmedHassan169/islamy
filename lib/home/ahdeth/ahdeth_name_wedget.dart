import 'package:flutter/material.dart';
import 'package:islamy2/home/ahdeth/ahdeth_tap.dart';
import 'package:islamy2/home/ahdeth/ahdth_details.dart';

//  تانى حاجه كلاس يتحط  فيه محتويات اللى هتتعرض فى الكلاس الاول
class HadethNameWidget extends StatelessWidget {
  // كلااس  لمحتويات كل سوره
  HadethArgus hadeth;

  HadethNameWidget(this.hadeth);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AhadethDetails.Routname,
            arguments: hadeth ); // همرر البراميتر  بتوع العنوان والمحتوى معاهم كا ارجيومنت عشان هعرضهم هناك
        // وهناك هستقبلو فى moudal route

      },
      child: Text(
        hadeth.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}

