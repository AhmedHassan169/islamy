import 'package:flutter/material.dart';

class AyatWidget extends StatelessWidget {
  // كلاس لمحتويات الايات عشان احط الارقام بين الايات
  String content;
  int index;
  AyatWidget(this.index, this.content);
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Text(
          '$content{ ${index + 1} }',
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ));
  }
}
