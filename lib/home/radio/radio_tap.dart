import 'package:flutter/material.dart';

class Radio_tap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Center(child: Image.asset('assets/images/radio.png')),
          Container(
            margin: EdgeInsets.only(top: 30),
            child:   Text(
              'اذاعه القرأن الكريم',
                style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 70),
              child: Image.asset('assets/images/radioPlay.png')),
        ],
      ),
    );
  }
}
