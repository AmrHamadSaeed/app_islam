import 'package:flutter/material.dart';
import 'package:islam100/home/quran/sura_details_screen.dart';
import 'package:islam100/my_theme.dart';
import 'package:islam100/providers/app_config_prvider.dart';
import 'package:provider/provider.dart';

class ItemSuraName extends StatelessWidget {
String name ;
int index;
ItemSuraName({required this.name , required this.index});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
        arguments:SuraDetailsArgs(
            name: '$name',
            index: index),
        );
      },
      child: Text(
        name,
        textAlign: TextAlign.center,

        style:provider.isDarkMode()?
        Theme.of(context).textTheme.titleSmall?.copyWith(
          color: MyTheme.yellowColor
        )
            :
        Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
