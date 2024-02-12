import 'package:flutter/material.dart';
import 'package:islam100/home/quran/sura_details_screen.dart';
import 'package:islam100/my_theme.dart';
import 'package:islam100/providers/app_config_prvider.dart';
import 'package:provider/provider.dart';

class ItemHadethDetailsScreen extends StatelessWidget {
String content;
ItemHadethDetailsScreen({required this.content});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return  Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: provider.isDarkMode()?
            MyTheme.whiteColor
                :
            MyTheme.whiteColor,
            blurStyle:provider.isDarkMode()?
            BlurStyle.outer
                :
            BlurStyle.inner,
            spreadRadius: 3,
            blurRadius: MediaQuery.of(context).size.height * 0.01,
          ),
        ],
      ),
      child: Text(
        '$content',
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
