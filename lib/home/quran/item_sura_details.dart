import 'package:flutter/material.dart';
import 'package:islam100/home/quran/sura_details_screen.dart';
import 'package:islam100/my_theme.dart';
import 'package:islam100/providers/app_config_prvider.dart';
import 'package:provider/provider.dart';

class ItemSuraDetailsScreen extends StatelessWidget {
String name ;
int index;
ItemSuraDetailsScreen({required this.name , required this.index});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return  Column(
        children: [
          Text(
            ' $name (${index+1})',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style:provider.isDarkMode()?
              Theme.of(context).textTheme.titleSmall?.copyWith(
                color: MyTheme.yellowColor
              )
                  :
              Theme.of(context).textTheme.titleSmall,

          ),
        ],

    );
  }
}
