import 'package:flutter/material.dart';
import 'package:islam100/home/quran/sura_details_screen.dart';

class ItemSuraDetailsScreen extends StatelessWidget {
String name ;
int index;
ItemSuraDetailsScreen({required this.name , required this.index});
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Text(
            ' $name (${index+1})',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,

          ),
        ],

    );
  }
}
